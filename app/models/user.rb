class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_profile

  validates :name, presence: true

  validates :alias, presence: true

  has_one :profile, dependent: :destroy

  has_many :commission, dependent: :destroy

  has_many :user_story

  acts_as_messageable
end
