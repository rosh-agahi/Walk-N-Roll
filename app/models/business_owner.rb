class BusinessOwner < ApplicationRecord
  has_many :clients
  has_many :dogwalkers
  has_many :appointments, through: :dogwalkers
end
