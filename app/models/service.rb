class Service < ApplicationRecord
  belongs_to :business_owner
  has_many :appointments

  def display_price
    "$#{sprintf('%.2f',price)}"
  end

  def drop_down_display
    "#{description}, #{display_price}"
  end
end
