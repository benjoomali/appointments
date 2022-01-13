# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

User.create!(email: "ben@test.com", password: "f0rg3t", password_confirmation: "f0rg3t")
Calendar.create!(name: "Main", description: "This is the main calendar for testing", user_id: 1, interval: 30)
Form.create!(name: "Main", description: "This is the main form for testing", user_id: 1)
Availability.create!(calendar_id: 1, start_time: DateTime.parse("Monday at 10am UTC"), end_time: DateTime.parse("Monday at 4pm UTC"))
Availability.create!(calendar_id: 1, start_time: DateTime.parse("Tuesday at 10am UTC"), end_time: DateTime.parse("Tuesday at 2pm UTC"))
Availability.create!(calendar_id: 1, start_time: DateTime.parse("Thursday at 10am UTC"), end_time: DateTime.parse("Thursday at 4pm UTC"))
Availability.create!(calendar_id: 1, start_time: DateTime.parse("Friday at 11:30am UTC"), end_time: DateTime.parse("Friday at 2pm UTC"))
