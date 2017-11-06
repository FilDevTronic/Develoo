class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  validates :alias, presence: true

  after_create :create_profile

  acts_as_messageable

  has_one :profile, dependent: :destroy

  has_many :commission

  has_many :user_story

  has_many :commission_user_story
end
