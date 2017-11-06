class Commission < ApplicationRecord
  belongs_to :user
  has_many :user_story
end
