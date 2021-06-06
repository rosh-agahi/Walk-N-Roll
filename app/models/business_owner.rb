class BusinessOwner < ApplicationRecord
  has_many :clients
  has_many :dogwalkers
  has_many :services
  has_many :appointments, through: :dogwalkers

  validates :username, uniqueness: true, presence: true
  validates :business_join_code, uniqueness: true, presence: true

  has_secure_password

end
