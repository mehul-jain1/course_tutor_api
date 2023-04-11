FactoryGirl.define do
  factory :course do
    name Faker::Name.name
    description Faker::Markdown.emphasis

    # user_with_posts will create post data after the user has been created
    factory :course_with_tutors do
      # tutor_count is declared as a transient attribute available in the
      # callback via the evaluator
      transient do
        tutor_count { 5 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |course, evaluator|
        create_list(:tutor, evaluator.tutor_count, course: course)

        # You may need to reload the record here, depending on your application
        course.reload
      end
    end
  end
end
