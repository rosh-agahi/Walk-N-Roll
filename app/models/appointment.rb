class Appointment < ApplicationRecord
  belongs_to :dog
  belongs_to :dogwalker
  belongs_to :service

  def display_datetime
    "#{apptdate.strftime("%A %m/%d/%Y %I:%M")} #{apptdate.strftime("%H").to_i > 12 ? ('PM') : ('AM')}"
  end

end
