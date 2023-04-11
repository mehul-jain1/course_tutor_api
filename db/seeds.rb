c = Course.new(name: Faker::Name.name, description: Faker::Markdown.emphasis)
c.save!

t1 = Tutor.new(name: Faker::Name.name, course: c)
t1.save!

t2 = Tutor.new(name: Faker::Name.name, course: c)
t2.save!
