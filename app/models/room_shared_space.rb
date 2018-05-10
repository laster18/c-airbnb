class RoomSharedSpace < ApplicationRecord
  belongs_to :room
  belongs_to :shared_space
end
