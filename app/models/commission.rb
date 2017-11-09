class Commission < ApplicationRecord
  belongs_to :user
  scope :active, -> { where(hidden: false) }
  mount_uploader :image, ImageUploader

  def self.search_by_description(search)
    if search
      where('description ILIKE ? AND hidden = false ', "%#{search}%")
    else
      active
    end
  end
end
