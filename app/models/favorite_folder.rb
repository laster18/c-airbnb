class FavoriteFolder < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destory
  has_many :rooms, through: :favorites

  enum release: { everyone: 0, invite_only: 1}
end
