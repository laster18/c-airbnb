class SharedSpace < ApplicationRecord
  has_many :rooms, through: :room_shared_spaces
  has_many :room_shared_spaces
end
