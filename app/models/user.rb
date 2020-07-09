class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :teacher, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one_attached :photo
  has_many :notifications, foreign_key: :recipient_id

  def profile_photo?
    photo.attached?
  end
end
