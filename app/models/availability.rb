class Availability < ApplicationRecord
  require 'slotfinder/slotfinder.rb'


  belongs_to :calendar
  
  # Scopes 
  scope :in_range, -> range {
    where('(from BETWEEN ? AND ?)', range.first, range.last)
  }
  scope :in_range_of_start, -> range {
    where('start_time >= ? AND start_time <= ?', range.first, range.last)
  }
  scope :exclude_self, -> id { where.not(id: id) }
  

  # Validation, no breathing
  validates :start_time, :end_time, presence: true 
  # validate :real_times, :overlapping_times
  # validate that the end_time can't be less than the start_time 

  def overlapping_times
    range = Range.new start_time, end_time
    overlaps = Availability.exclude_self(id).in_range(range)
    unless overlaps.blank? 
      errors.add(:overlap_error, 'There is already an availability set for this time')
    end
  end

  def real_times
    if start_time > end_time 
      errors.add(:availability, "End time can't be earlier than start time.")
    end
  end


  # Find all appointments on the day of availability and exclude them in Slotfinder method
  def list_slots
    day = start_time.all_day
    appts_for_day = calendar.appointments.where(start_time: day)
    appt_array = Array.new
    appts_for_day.each do |appt|
      range = Range.new appt.start_time, appt.end_time
      appt_array << range
    end

    return Slotfinder.get_slots( 
      for_range: start_time..end_time,
      slot_length_mins: calendar.interval,
      interval_mins: calendar.interval,
      exclude_times: appt_array
    )
  end

end
