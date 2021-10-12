class Appointment < ApplicationRecord
  belongs_to :calendar
  belongs_to :form_entries, optional: true

  validates :start_time, :end_time, presence: true
  validate :check_interval


  private
  #TODO:validate that availability exists
  def check_availability
  end

  #validate that the appointment created is the exact interval set by calendar
  def check_interval 
    interval = self.calendar.interval 
    time = (end_time - start_time)/60
    if time.to_i != self.calendar.interval
      errors.add(:appointment, "This appointment does not meet the interval requirements")
    end
  end 
  #validate that the time is correct


  #has_many :entry_appointments, :dependent => :destroy 
  #has_many :form_entries, through: :entry_appointments
  #accepts_nested_attributes_for :entry_appointments



  # Return false if more or equal appointments than available
=begin
  def check_availability
    if self.entry_appointments.count >= capacity 
      return false
    else 
      puts "Still available"
      return true 
    end 
  end

=end


end
