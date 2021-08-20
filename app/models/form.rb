class Form < ApplicationRecord
  belongs_to :user
  has_many :form_entries

  has_many :form_calendars, :dependent => :destroy 
  has_many :calendars, through: :form_calendars
  accepts_nested_attributes_for :form_calendars
end
