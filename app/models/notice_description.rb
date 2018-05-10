class NoticeDescription < ApplicationRecord
  has_many :rooms, through: :room_notices
  has_many :room_notices
end
