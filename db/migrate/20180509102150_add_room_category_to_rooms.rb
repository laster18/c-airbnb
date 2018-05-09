class AddRoomCategoryToRooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :room_category, foreign_key: true
    add_reference :rooms, :room_building_type, foreign_key: true
    add_reference :rooms, :room_bathroom, foreign_key: true
    add_reference :rooms, :room_deadline, foreign_key: true
  end
end
