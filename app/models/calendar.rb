# Calendar Model references an individual calendar where the user will define scheduling, holidays etc..

class Calendar < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :appointments
  has_many :availabilities

  has_many :form_calendars, :dependent => :destroy 
  has_many :forms, through: :form_calendars
  accepts_nested_attributes_for :form_calendars
end
