class FormEntry < ApplicationRecord
  belongs_to :form

  # has_many :entry_appointments, :dependent => :destroy 
  # has_many :appointments, through: :entry_appointments
  # accepts_nested_attributes_for :entry_appointments

  validates :name, presence: true
  # validates_associated :entry_appointments, :appointments
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Please enter a valid email address" }, length: { minimum: 4, maximum: 254 }
  validates :phone, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: 'Please enter a valid phone number.' }

end
