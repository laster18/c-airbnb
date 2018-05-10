class AddNoticeDescriptionToRoomNotices < ActiveRecord::Migration[5.0]
  def change
    add_reference :room_notices, :notice_description, foreign_key: true
  end
end
