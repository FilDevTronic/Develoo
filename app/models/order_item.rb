class OrderItem < ApplicationRecord
  belongs_to :commission
  belongs_to :user_story
  belongs_to :order
end
