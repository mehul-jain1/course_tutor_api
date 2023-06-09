# spec/requests/courses_spec.rb

require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  describe 'POST /courses' do
    context 'with valid parameters' do
      let(:course_params) { attributes_for(:course) }
      let(:tutor_params) { attributes_for(:tutor) }

      it 'creates a new course and tutors' do
        expect {
          post '/courses', params: {
            course: {
              name: course_params[:name],
              description: course_params[:description],
              tutors_attributes: [
                { name: tutor_params[:name], email: tutor_params[:email] }
              ]
            }
          }
        }.to change { Course.count }.by(1).and change { Tutor.count }.by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns an error message' do
        post '/courses', params: {}

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_empty
      end
    end

    context 'with missing parameters' do
      it 'returns an error message' do
        post '/courses', params: {
          course: {
            name: '',
            description: ''
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_empty
      end
    end
  end

  describe 'PUT /courses' do
    let(:course) { create(:course) }
    
    context 'with valid parameters' do
      let(:course_params) { attributes_for(:course) }
      let(:tutor_params) { attributes_for(:tutor) }
      it 'updates a course and tutors' do
        course.reload
        
        expect {
          put "/courses/#{course.id}", params: {
            course: {
              id: course.id,
              name: course_params[:name],
              description: course_params[:description],
              tutors_attributes: [
                { name: tutor_params[:name], email: tutor_params[:email] }
              ]
            }
          }
        }.to change { Course.count }.by(0).and change { Tutor.count }.by(1)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns an error message' do
        put "/courses/#{course.id}", params: {}

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_empty
      end
    end

    context 'with missing parameters' do
      it 'returns an error message' do
        put "/courses/#{course.id}", params: {
          course: {
            name: '',
            description: ''
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_empty
      end
    end
  end

  describe 'GET /courses' do
    it 'returns a list of courses with tutors' do
      course = create(:course_with_tutors)

      get '/courses'

      expect(response).to have_http_status(:ok)
      expect(json.length).to eq(1)
      expect(json[0]['id']).to eq(course.id)
      expect(json[0]['name']).to eq(course.name)
      expect(json[0]['description']).to eq(course.description)
      expect(json[0]['tutors'].length).to eq(5)
    end
  end
end