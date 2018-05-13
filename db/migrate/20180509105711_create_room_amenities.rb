class CreateRoomAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :room_amenities do |t|
      t.references :room, foreign_key: true, null: false
      t.references :amenity, foreign_key: true, null: false
      t.timestamps
    end
    add_index      :room_amenities, [:room_id, :amenity_id]
  end
end
