class EntryAppointment < ApplicationRecord
  belongs_to :form_entry
  belongs_to :appointment
end
