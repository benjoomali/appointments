class Appointment < ApplicationRecord
  require "date" 
  belongs_to :calendar
  belongs_to :form_entries, optional: true

  # Scopes 
  #scope :in_range, -> range {
  #  where('(from BETWEEN ? AND ?)', range.first, range.last)
  #}
  scope :in_range_of_start, -> range {
    where('start_time >= ? AND start_time <= ?', range.first, range.last)
  }
  scope :exclude_self, -> id { where.not(id: id) }
  scope :current_month, -> { where(start_time: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)}

  validates :start_time, :end_time, presence: true
  validate :validate_interval
  validate :validate_availabilities_of_day
  validate :validate_falls_within_an_availability
  validate :validate_appointment_overlap
  

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

  # Validates the start_time of the appointment against other appointments
  def validate_appointment_overlap
    # Set a range from the New Appointment Start to End
    range = Range.new start_time, end_time

    overlaps = Appointment.in_range_of_start(range).exclude_self(id)
    # If there are overlaps, then return an error
    unless overlaps.blank? 
      errors.add(:overlap_error, 'There is already an appointment set for this time')
    end
  end 

end
