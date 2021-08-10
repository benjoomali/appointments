class EntryAppointment < ApplicationRecord
  belongs_to :form_entry
  belongs_to :appointment

  #validate :appointment_id, :presence => true 
  validate :validate_capacity_of_appointment

  # Validation for the Appointment's Capacity, return error if over
  def validate_capacity_of_appointment
    appt = Appointment.find(self.appointment_id)
    max_capacity = appt.capacity 
    count = appt.entry_appointments.count

    unless count < max_capacity
      errors.add(:appointment, "The appointment has reached max capacity")
    end 

  end


end
