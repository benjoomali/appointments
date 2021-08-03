class Schedule < ApplicationRecord
  belongs_to :calendar

  # purpose of this model is to give the user a way to set their availability

  DAYS_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze
  INTERVAL = 30

  validates :start_datetime, :end_datetime, presence: true

  # method make availability
  # take start_time and end_time and convert to strftime
  # match day_of_week integer to DAYS_OF_WEEK 
  # using Slotfinder method, call method generate_slots for given day and times
  # create Slots records based off of output

end
