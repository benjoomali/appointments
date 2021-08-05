class Appointment < ApplicationRecord
  belongs_to :calendar

  has_many :entry_appointments, :dependent => :destroy 
  has_many :form_entries, through: :entry_appointments
  accepts_nested_attributes_for :entry_appointments

  validates :capacity, presence: true

  # Return false if more or equal appointments than available
  def check_availability
    if self.entry_appointments.count >= capacity 
      return false
    else 
      puts "Still available"
      return true 
    end 
  end


end
