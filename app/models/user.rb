class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, ImageUploader

  has_many :rooms
  has_many :favorite_folders
  has_many :favorites

  enum gender: { male: 0, female: 1, noselect: 2 }

end
