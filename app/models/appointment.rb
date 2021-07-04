class Appointment < ApplicationRecord
  belongs_to :dog
  belongs_to :dogwalker
  belongs_to :service

  validates :apptdate, presence: true, message: "Appointment must have a Date and Time."
  validates :service_id, presence: true, message: "Please select a service for the appointment."
  validates :dog_id, presence: true, message: "Please select the dog this appointment belongs to. "


  def display_datetime
    "#{apptdate.strftime("%A %m/%d/%Y %I:%M")} #{apptdate.strftime("%H").to_i > 12 ? ('PM') : ('AM')}"
  end

  def total_cost
    service.price + tip
  end

end
