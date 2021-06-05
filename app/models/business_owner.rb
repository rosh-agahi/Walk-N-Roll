class BusinessOwner < ApplicationRecord
  has_many :clients
  has_many :dogwalkers
  has_many :appointments, through: :dogwalkers

  has_secure_password
  
end
