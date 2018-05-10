class RoomAvailableSpace < ApplicationRecord
  belongs_to :room
  belongs_to :available_space
end
