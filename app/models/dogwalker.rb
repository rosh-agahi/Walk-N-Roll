class Dogwalker < ApplicationRecord
  belongs_to :business_owner
  has_many :appointments

  def total_tips_earned
    ApplicationController.helpers.dollar_display(appointments.sum(:tip))
  end
end
