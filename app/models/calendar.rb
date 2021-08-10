# Calendar Model references an individual calendar where the user will define scheduling, holidays etc..

class Calendar < ApplicationRecord
  belongs_to :user
  has_many :schedules
  has_many :appointments
end
