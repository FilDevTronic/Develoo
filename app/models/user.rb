class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  
  validates :alias, presence: true

  has_one :profile, dependent: :destroy

  after_create :create_profile

  acts_as_messageable
end
