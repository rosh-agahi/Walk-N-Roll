class Service < ApplicationRecord
  belongs_to :business_owner

  def display_price
    "$#{sprintf('%.2f',price)}"
  end
end
