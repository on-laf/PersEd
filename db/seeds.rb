# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Cleaning the database...'
FlashcardTemplate.destroy_all
FlashcardSet.destroy_all
Teacher.destroy_all
Topic.destroy_all
Subject.destroy_all
User.destroy_all

# this might need cleaning up as we will have repetition of topics
puts 'Creating subjects and topics...'
subjects = ['Maths', 'Biology', 'Physics', 'Chemistry', 'English', 'French', 'German', 'Philosophy', 'History', 'Geography', 'Economics', 'Sociology', 'Psychology']
subjects.each do |subject|
  new_subject = Subject.create(subject_name: subject)
end
topics = []
15.times do
  new_topic = Topic.new(topic_name: Faker::Educator.unique.subject, subject: Subject.find_by(subject_name: 'Economics'))
  new_topic.save
  topics << new_topic
end


puts 'Creating teachers...'
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

  new_teacher = Teacher.new(
    user: new_user,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    )
  new_teacher.save

 10.times do
   new_flashcard_set = FlashcardSet.new(
     name: Faker::Educator.course_name,
     teacher: new_teacher,
     )
   new_flashcard_set.save
   10.times do
      new_flashcard_template = FlashcardTemplate.new(
        question: "#{Faker::Quotes::Shakespeare.hamlet}?",
        answer: Faker::TvShows::BojackHorseman.quote,
        flashcard_set: new_flashcard_set,
        teacher: new_teacher,
        topic: topics[rand(0...topics.count)]
        )
      new_flashcard_template.save
      end
    end

  5.times do
    new_group = Group.new(
      teacher: new_teacher,
      class_name: "#{new_teacher.last_name}: #{rand(1..30)}"
      )
    new_group.save
  end

  TeacherSubject.create(teacher: new_teacher, subject: Subject.find_by(subject_name: subjects.sample))

  # rescue ActiveStorage::IntegrityError
  #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
  #   new_teacher.photo.attach(
  #     io: file,
  #     filename: "profilepic.png",
  #     content_type: 'image/png'
  #     )
end

puts 'Creating students...'
100.times do
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

  # rescue ActiveStorage::IntegrityError
  #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
  #   new_teacher.photo.attach(
  #     io: file,
  #     filename: "profilepic.png",
  #     content_type: 'image/png'
  #     )
end

puts 'Done!'
