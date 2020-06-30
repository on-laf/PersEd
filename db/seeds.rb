# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'Cleaning the database...'
User.destroy_all

puts 'Creating teachers...'
10.times do
  new_user = User.new(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456'
    )
  new_user.save
  new_teacher = Teacher.new(
    user_id: new_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    )
    # file = URI.open("https://thispersondoesnotexist.com/")
    # new_teacher.photo.attach(
    #   io: file,
    #   filename: "profilepic.png",
    #   content_type: 'image/png'
    #   )
    new_teacher.save
    # rescue ActiveStorage::IntegrityError
    #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
    #   new_teacher.photo.attach(
    #     io: file,
    #     filename: "profilepic.png",
    #     content_type: 'image/png'
    #     )
    5.times do
      new_group = Group.new(
        teacher_id: new_teacher.id,
        class_name: "#{Faker::Educator.course_name}: #{rand(1..30)}"
        )
      new_group.save
      end
    end

puts 'Creating Students...'
100.times do
  new_user = User.new(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456'
    )
  new_user.save
  new_student = Student.new(
    user_id: new_user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    )
    # file = URI.open("https://thispersondoesnotexist.com/")
    # new_student.photo.attach(
    #   io: file,
    #   filename: "profilepic.png",
    #   content_type: 'image/png'
    #   )
    new_student.save
    # rescue ActiveStorage::IntegrityError
    #   file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
    #   new_teacher.photo.attach(
    #     io: file,
    #     filename: "profilepic.png",
    #     content_type: 'image/png'
    #     )
      end
  puts 'done...'
