class Profile < ApplicationRecord
  belongs_to :user
  validates :image, file_size: { less_than: 2.megabytes }
  mount_uploader :image, ImageUploader
  mount_uploaders :attachments, ImageUploader
end
