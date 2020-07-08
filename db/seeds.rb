# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Cleaning the database...'
StudentFlashcardSet.destroy_all
FlashcardHomework.destroy_all
FlashcardSet.destroy_all
Teacher.destroy_all
Topic.destroy_all
Subject.destroy_all
User.destroy_all

# this might need cleaning up as we will have repetition of topics
# subject seeds ok for demo
puts 'Creating subjects and topics...'
subjects = ['Maths', 'Biology', 'Physics', 'Chemistry', 'English', 'French', 'German', 'Philosophy', 'History', 'Geography', 'Economics', 'Sociology', 'Psychology']
subjects.each do |subject|
  new_subject = Subject.create(subject_name: subject)
end

#randomn topic seeds. not cool for demo.
# topics = []
# 15.times do
#   new_topic = Topic.new(topic_name: Faker::Educator.unique.subject, subject: Subject.find_by(subject_name: 'Economics'))
#   new_topic.save
#   topics << new_topic
# end

# topics for demo
Topic.create(topic_name: "Microeconomics", subject: Subject.find_by(subject_name: 'Economics'))
Topic.create(topic_name: "Macroeconomics", subject: Subject.find_by(subject_name: 'Economics'))
Topic.create(topic_name: "International Economics", subject: Subject.find_by(subject_name: 'Economics'))
Topic.create(topic_name: "Development Economics", subject: Subject.find_by(subject_name: 'Economics'))


# Topic.create(topic_name: "Economic Development", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "Measuring Development", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "The Role of Domestic Factors", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "The Role of International Trade", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "The Role of Foreign Direct Investment (FDI)", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "The Roles of Foreign Aid and Multilateral Development Assistance", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "The Role of International Debt", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "The Balance Between Markets and Intervention", subject: Subject.find_by(subject_name: 'Economics'))
# Topic.create(topic_name: "Alternative Approaches", subject: Subject.find_by(subject_name: 'Economics'))

puts 'Creating demo users...'

demo_teacher_user = User.new(
    email: "ze.pinto@nova.com",
    password: '123456',
    password_confirmation: '123456'
    )
# file = URI.open("https://thispersondoesnotexist.com/")
# demo_teacher_user.photo.attach(
#   io: file,
#   filename: "profilepic.png",
#   content_type: 'image/png'
#   )
demo_teacher_user.save

demo_student_user = User.new(
    email: "janis.howler@nova.com",
    password: '123456',
    password_confirmation: '123456'
    )
# file2 = URI.open("https://thispersondoesnotexist.com/")
# demo_student_user.photo.attach(
#   io: file,
#   filename: "profilepic.png",
#   content_type: 'image/png'
#   )
demo_student_user.save

demo_teacher = Teacher.new(
    user: demo_teacher_user,
    first_name: "Ze",
    last_name: "Pinto",
    )
  demo_teacher.save

demo_student = Student.new(
    user: demo_student_user,
    first_name: "Janis",
    last_name: "Howler",
    )
  demo_student.save

  puts 'Creating demo subjects...'

demo_teacher_subject1 = TeacherSubject.new(
  teacher: demo_teacher,
  subject: Subject.find_by(subject_name: 'Economics')
  )
demo_teacher_subject1.save

demo_teacher_subject2 = TeacherSubject.new(
  teacher: demo_teacher,
  subject: Subject.find_by(subject_name: 'Maths')
  )
demo_teacher_subject2.save

puts 'Creating demo Flashcards...'

new_flashcard_set_1 = FlashcardSet.new(
     name: "Economic Development",
     teacher: demo_teacher,
     )
new_flashcard_set_1.save
new_flashcard_template1 = FlashcardTemplate.new(
  question: "Distinguish between economic growth and economic development",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template1.save

new_flashcard_template2 = FlashcardTemplate.new(
  question: "Explain the multidimensional nature of economic development",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template2.save

new_flashcard_template3 = FlashcardTemplate.new(
  question: "Explain, using examples, that economically less developed countries differ enormously from each other",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template3.save

new_flashcard_template4 = FlashcardTemplate.new(
  question: "Distinguish between GDP per capita figures and GNI per capita figures",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template4.save

new_flashcard_template5 = FlashcardTemplate.new(
  question: "Distinguish between GDP per capita figures and GDP per capita figures at purchasing power parity (PPP) exchange rates.",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template5.save

new_flashcard_template6 = FlashcardTemplate.new(
  question: "Explain the measures that make up the Human Development Index (HDI)",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template6.save

new_flashcard_template7 = FlashcardTemplate.new(
  question: "Explain that composite indicators include more than one measure and so are considered to be better indicators of economic development.",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template7.save

new_flashcard_template8 = FlashcardTemplate.new(
  question: "Explain why a country's GDP/ GNI per capita global ranking may be lower, or higher, than its HDI global ranking",
  answer: Faker::TvShows::BojackHorseman.quote,
  flashcard_set: new_flashcard_set_1,
  teacher: demo_teacher,
  topic: Topic.find_by(topic_name: 'Development Economics')
  )
new_flashcard_template8.save

new_flashcard_set_2 = FlashcardSet.new(
     name: "Measuring Development",
     teacher: demo_teacher,
     )
new_flashcard_set_2.save
12.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_2,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

new_flashcard_set_3 = FlashcardSet.new(
     name: "The Role of Domestic Factors",
     teacher: demo_teacher,
     )
new_flashcard_set_3.save
15.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_3,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

new_flashcard_set_4 = FlashcardSet.new(
     name: "The Role of International Trade",
     teacher: demo_teacher,
     )
new_flashcard_set_4.save
14.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_4,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end


new_flashcard_set_5 = FlashcardSet.new(
     name: "The Role of Foreign Direct Investment (FDI)",
     teacher: demo_teacher,
     )
new_flashcard_set_5.save
9.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_5,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

new_flashcard_set_6 = FlashcardSet.new(
     name: "The Roles of Foreign Aid and Multilateral Development Assistance",
     teacher: demo_teacher,
     )
new_flashcard_set_6.save
16.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_6,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

new_flashcard_set_7 = FlashcardSet.new(
     name: "The Role of International Debt",
     teacher: demo_teacher,
     )
new_flashcard_set_7.save
10.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_7,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

new_flashcard_set_8 = FlashcardSet.new(
     name: "The Balance Between Markets and Intervention",
     teacher: demo_teacher,
     )
new_flashcard_set_8.save
11.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_8,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

new_flashcard_set_9 = FlashcardSet.new(
     name: "Alternative Approaches",
     teacher: demo_teacher,
     )
new_flashcard_set_9.save
11.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set_9,
        teacher: demo_teacher,
        topic: Topic.find_by(topic_name: 'Development Economics')
        )
      new_flashcard_template.save
      end

      puts 'Creating demo groups and students...'


      subjectcount = 101
      4.times do
          new_demo_group = Group.new(
            teacher: demo_teacher,
            # class_name: "#{Subject.find_by(subject: demo_teacher_subject1).subject_name}: #{subjectcount}"
            class_name: "Economics: #{subjectcount}"
            )
          new_demo_group.save
          subjectcount += 1

          demo_student_into_group = StudentsGroup.new(
            student: demo_student,
            group: new_demo_group
            )
          demo_student_into_group.save

            10.times do
              new_user = User.new(
                email: Faker::Internet.email,
                password: '123456',
                password_confirmation: '123456'
                )
              # file = URI.open("https://thispersondoesnotexist.com/")
              # new_user.photo.attach(
              #   io: file,
              #   filename: "profilepic.png",
              #   content_type: 'image/png'
              #   )
              new_user.save

              new_student = Student.new(
                user: new_user,
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                )
              new_student.save

              new_demo_student_group = StudentsGroup.new(
                student: new_student,
                group: new_demo_group
                )
              new_demo_student_group.save
              # rescue ActiveStorage::IntegrityError
              #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
              #   new_teacher.photo.attach(
              #     io: file,
              #     filename: "profilepic.png",
              #     content_type: 'image/png'
              #     )
                end
              end

              puts 'Done seeding for demo...'


            # rescue ActiveStorage::IntegrityError
            #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
            #   new_teacher.photo.attach(
            #     io: file,
            #     filename: "profilepic.png",
            #     content_type: 'image/png'
            #     )
        #   end
        # end

        # TeacherSubject.create(teacher: new_teacher, subject: Subject.find_by(subject_name: subjects.sample))

# 10.times do
#   new_user = User.new(
#     email: Faker::Internet.email,
#     password: '123456',
#     password_confirmation: '123456'
#     )
#   # file = URI.open("https://thispersondoesnotexist.com/")
#   # new_user.photo.attach(
#   #   io: file,
#   #   filename: "profilepic.png",
#   #   content_type: 'image/png'
#   #   )
#   new_user.save

#   new_teacher = Teacher.new(
#     user: new_user,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     )
#   new_teacher.save

#   new_flashcard_set = FlashcardSet.new(
#      name: Faker::Educator.course_name,
#      teacher: new_teacher,
#      )

#  10.times do
#    new_flashcard_set = FlashcardSet.new(
#      name: Faker::Educator.course_name,
#      teacher: new_teacher,
#      )
#    new_flashcard_set.save
#    10.times do
#       new_flashcard_template = FlashcardTemplate.new(
#         question: "#{Faker::Quotes::Shakespeare.hamlet}?",
#         answer: Faker::TvShows::BojackHorseman.quote,
#         flashcard_set: new_flashcard_set,
#         teacher: new_teacher,
#         topic: topics[rand(0...topics.count)]
#         )
#       new_flashcard_template.save
#       end
#     end

#   5.times do
#     new_group = Group.new(
#       teacher: new_teacher,
#       class_name: "#{new_teacher.last_name}: #{rand(1..30)}"
#       )
#     new_group.save
#   end

#   TeacherSubject.create(teacher: new_teacher, subject: Subject.find_by(subject_name: subjects.sample))

#   # rescue ActiveStorage::IntegrityError
#   #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
#   #   new_teacher.photo.attach(
#   #     io: file,
#   #     filename: "profilepic.png",
#   #     content_type: 'image/png'
#   #     )
# end

# puts 'Creating students...'
# 100.times do
#   new_user = User.new(
#     email: Faker::Internet.email,
#     password: '123456',
#     password_confirmation: '123456'
#     )
#   # file = URI.open("https://thispersondoesnotexist.com/")
#   # new_user.photo.attach(
#   #   io: file,
#   #   filename: "profilepic.png",
#   #   content_type: 'image/png'
#   #   )
#   new_user.save

#   new_student = Student.new(
#     user: new_user,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     )
#   new_student.save

#   # rescue ActiveStorage::IntegrityError
#   #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
#   #   new_teacher.photo.attach(
#   #     io: file,
#   #     filename: "profilepic.png",
#   #     content_type: 'image/png'
#   #     )
# end

# puts 'Done!'
