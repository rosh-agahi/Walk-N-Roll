class BusinessOwner < ApplicationRecord
  has_many :clients
  has_many :dogwalkers
  has_many :services
  has_many :appointments, through: :dogwalkers
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true 

  has_secure_password

  def revenue
    r = 0
    prices = appointments.collect {|a| a.service.price }
    rev = prices.inject(0){|r,x| r + x }
    "$#{sprintf('%.2f',rev)}"
  end

end
