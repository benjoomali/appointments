class Appointment < ApplicationRecord
  belongs_to :calendar
  belongs_to :form_entries, optional: true

  validates :start_time, :end_time, presence: true
  validate :validate_interval
  validate :validate_availabilities_of_day
  validate :validate_falls_within_an_availability
  
  #TODO: public method
  def check_availability
  end

  private

  def validate_falls_within_an_availability
    day = self.start_time
    #check to see if there are any availabilities that day
    availabilities = Availability.where(start_time: day.all_day)
    counter = 0
    availabilities.each do |avail|
      time_range = avail.start_time..avail.end_time 
      if time_range === day
        counter += 1 
      end
    end 
    if counter < 1 
      errors.add(:appointment, "Appointment does not fall within any availability that day")
    end
  end

  # validate that there are availabilities on the day of
  def validate_availabilities_of_day
    # find the date of the appointment trying to be made
    day = self.start_time
    # find all Availability records on the day the Appointment was created for
    if Availability.where(start_time: day.all_day).blank?
      errors.add(:appointment, "There are no availabilities on this day")
    end
  end

  # validate that the appointment created is the exact interval set by calendar
  def validate_interval 
    interval = self.calendar.interval 
    time = (end_time - start_time)/60
    if time.to_i != self.calendar.interval
      errors.add(:appointment, "This appointment does not meet the interval requirements")
    end
  end 

  # validate that the time is correct


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
