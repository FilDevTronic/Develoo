class Commission < ApplicationRecord
  belongs_to :user
  has_many :user_stories
end
