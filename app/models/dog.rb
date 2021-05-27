class Dog < ApplicationRecord
  belongs_to :client
  has_many :appointments
end
