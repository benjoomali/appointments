class FormEntry < ApplicationRecord
  belongs_to :form

  has_many :entry_appointments, :dependent => :destroy 
  has_many :appointments, through: :entry_appointments
  accepts_nested_attributes_for :entry_appointments

  validates :name, :email, presence: true
  validates :entry_appointments, :presence => true

end
