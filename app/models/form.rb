class Form < ApplicationRecord
  belongs_to :user
  has_many :form_entries

  has_many :form_calendars, :dependent => :destroy 
  has_many :calendars, through: :form_calendars
  accepts_nested_attributes_for :form_calendars

  # Show the attached calendar via form_calendar join
  def calendar_attached
    name = ""
    if calendars.any? 
      name = calendars.first.name  
    end

    return name
  end


end
