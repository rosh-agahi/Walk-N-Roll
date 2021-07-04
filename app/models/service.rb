class Service < ApplicationRecord
  belongs_to :business_owner
  has_many :appointments

  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price

  scope :active, -> {where("status = ?", true)}

  def display_price
    "$#{sprintf('%.2f',price)}"
  end

  def drop_down_display
    "#{description}, #{display_price}"
  end
end
