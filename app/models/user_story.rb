class UserStory < ApplicationRecord
  belongs_to :commission, dependent: :destroy
end
