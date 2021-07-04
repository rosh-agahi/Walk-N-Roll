class Appointment < ApplicationRecord
  belongs_to :dog
  belongs_to :dogwalker
  belongs_to :service

  validates :apptdate, presence: true
  validates :service_id, presence: true
  validates :dog_id, presence: true


  def display_datetime
    "#{apptdate.strftime("%A %m/%d/%Y %I:%M")} #{apptdate.strftime("%H").to_i > 12 ? ('PM') : ('AM')}"
  end

  def total_cost
    service.price + tip
  end

end
