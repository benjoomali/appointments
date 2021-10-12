# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "ben@test.com", password: "f0rg3t", password_confirmation: "f0rg3t")
Calendar.create!(name: "Main", description: "This is the main calendar for testing", user_id: 1)
#Form.create!(name: "Main", description: "This is the main form for testing", user_id: 1, calendar_id)
#Schedule.create(day_of_week: 4, start_time: Time.parse("11:20am"), end_time: Time.parse("12:40pm"), calendar_id: 1)