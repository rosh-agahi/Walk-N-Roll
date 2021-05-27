class Dogwalker < ApplicationRecord
  belongs_to :business_owner
  has_many :appointments
end
