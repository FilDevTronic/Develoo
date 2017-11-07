class Commission < ApplicationRecord
  belongs_to :user
  has_many :order_items
  default_scope :active, -> { where(hidden: false) }
end
