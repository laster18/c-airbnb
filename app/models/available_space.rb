class AvailableSpace < ApplicationRecord
  has_many :room_available_spaces
  has_many :rooms, through: :room_available_spaces
end
