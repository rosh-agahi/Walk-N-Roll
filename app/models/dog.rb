class Dog < ApplicationRecord
  belongs_to :client
  has_many :appointments

  def name_with_client
    "#{name}  (#{client.name})"
  end

end
