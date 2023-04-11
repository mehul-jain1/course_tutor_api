class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]

  def index
    courses = Course.includes(:tutors)
    render json: courses, include: :tutors
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, include: :tutors, status: :created, location: @course
    else
      render json: {errors: @course.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course, include: :tutors, location: @course
    else
      render json: {errors: @course.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

  def course_params
    params.require(:course).permit(:name, :description, tutors_attributes: [:id, :name])
  end
end
