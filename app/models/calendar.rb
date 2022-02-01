# Calendar Model references an individual calendar where the user will define scheduling, holidays etc..

class Calendar < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :appointments
  has_many :availabilities

  has_many :form_calendars, :dependent => :destroy 
  has_many :forms, through: :form_calendars
  accepts_nested_attributes_for :form_calendars

  validates :name, presence: true 
  # Interval of the calendar cannot be longer than a full day in minutes
  validates :interval, numericality: { greater_than: 0, less_than_or_equal_to: 1440 }
end
