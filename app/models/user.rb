class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, ImageUploader

  has_many :rooms
  has_many :favorite_folders
  has_many :favorites
  has_many :send_user_messages, class_name: 'Message', :foreign_key => 'send_user_id'
  has_many :receive_user_messages, class_name: 'Message', :foreign_key => 'receice_user_id'

  enum gender: { male: 0, female: 1, noselect: 2 }

  def created_user
    created_at.strftime("%Y年%m月")
  end
end
