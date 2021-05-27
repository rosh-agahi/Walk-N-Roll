class Client < ApplicationRecord
  belongs_to :business_owner
  has_many :dogs
  has_may :appointments, through: :dogs
end
