class Profile < ApplicationRecord
  belongs_to :user
  validates :bio, presence: true
  validates :image, file_size: { less_than: 2.megabytes }
  mount_uploader :image, ImageUploader
  mount_uploader :attachments, ImageUploader
end
