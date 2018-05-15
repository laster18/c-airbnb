class AddRoomCategoryToRooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :room_category, foreign_key: true
    add_reference :rooms, :room_building_type, foreign_key: true
    add_reference :rooms, :user, foreign_key: true, null: false
  end
end
