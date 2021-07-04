class Client < ApplicationRecord
  belongs_to :business_owner
  has_many :dogs
  has_many :appointments, through: :dogs
  has_many :services, through: :appointments

  validates :name, presence: true
  validates :phonenumber, uniqueness: true, presence: true, format: { :with => /\d{7}/ }
  validates :address, presence: true 


  def revenue
    r = 0
    prices = services.collect { |s| s.price }
    rev = prices.inject(0){|r,x| r + x }
    "$#{sprintf('%.2f',rev)}"
  end

  def phonenumber_display
    p = phonenumber.to_s
    "(#{p[0..2]}) #{p[3..5]}-#{p[6..9]}"
  end

end
