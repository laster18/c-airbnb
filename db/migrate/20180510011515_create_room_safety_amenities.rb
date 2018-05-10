class CreateRoomSafetyAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :room_safety_amenities do |t|
      t.references :room, foreign_key: true, null: false
      t.references :safety_amenity, foreign_key: true, null: false
      t.timestamps
    end
  end
end
