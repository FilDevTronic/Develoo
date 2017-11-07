class Commission < ApplicationRecord
  belongs_to :user
  has_many :order_items
  scope :active, -> { where(hidden: false) }
end
