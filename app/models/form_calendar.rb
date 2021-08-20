class FormCalendar < ApplicationRecord
  # Join associations between the forms and calendars

  belongs_to :form
  belongs_to :calendar
end
