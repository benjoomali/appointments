class Appointment < ApplicationRecord
  belongs_to :calendar

  has_many :entry_appointments, :dependent => :destroy 
  has_many :form_entries, through: :entry_appointments
  accepts_nested_attributes_for :entry_appointments
end
