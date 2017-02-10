# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.delete_all
  Poll.delete_all
  Choice.delete_all
  Question.delete_all
  Response.delete_all

  user_one = User.create!(name: "Sweta")
  user_two = User.create!(name: "Bruk")
  user_three = User.create!(name: "Brooklyn")

  poll_one = Poll.create!(title: "Car", author_id: 1)

  question_one = Question.create!(body: "What color?", poll_id: 1)
  choice_one = Choice.create!(answer_choice: "A. Black", question_id: 1)
  choice_two = Choice.create!(answer_choice: "B. Red", question_id: 1)

  question_two = Question.create!(body: "What make?", poll_id: 1)
  choice_five = Choice.create!(answer_choice: "lexus", question_id: 2)
  choice_six = Choice.create!(answer_choice: "BMW", question_id: 2)

  response_one = Response.create!(user_id: 3 , choice_id: 1)
  response_two  = Response.create!(user_id: 2, choice_id: 2)

  poll_two = Poll.create!(title: "Cloud", author_id: 2)

  question_four = Question.create!(body: "It rains. Why?", poll_id: 2)
  choice_three = Choice.create!(answer_choice: "Yes", question_id: 3)
  choice_four = Choice.create!(answer_choice: "No", question_id: 3)

  question_three = Question.create!(body: "Cloud blue?", poll_id: 2)
  choice_seven = Choice.create!(answer_choice: "magic", question_id: 4)
  choice_eight = Choice.create!(answer_choice: "hungry?", question_id: 4)

  response_one = Response.create!(user_id: 1 , choice_id: 8)
  response_two  = Response.create!(user_id: 3, choice_id: 7)
end
