class Client < ApplicationRecord
  belongs_to :business_owner
  has_many :dogs
  has_many :appointments, through: :dogs
  has_many :services, through: :appointments

  def revenue
    r = 0
    prices = services.collect { |s| s.price }
    rev = prices.inject(0){|r,x| r + x }
    "$#{sprintf('%.2f',rev)}"
  end

end
