class RoomNotice < ApplicationRecord
  belongs_to :room
  belongs_to :notice
  belongs_to :notice_description
end
