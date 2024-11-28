class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences
  has_many :searches
  has_one_attached :photo, dependent: :destroy

  def current_experience
    experiences.find_by(is_current: true)
  end
end
