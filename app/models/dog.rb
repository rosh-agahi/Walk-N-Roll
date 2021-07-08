class Dog < ApplicationRecord
  belongs_to :client
  belongs_to :business_owner
  has_many :appointments

  def name_with_client
    "#{name}  (#{client.name})"
  end

end
