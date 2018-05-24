class FavoriteFolder < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :rooms, through: :favorites

  enum release: { invite_only: 0, everyone: 1}
end
