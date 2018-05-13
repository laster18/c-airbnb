class CreateRoomAvailableSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :room_available_spaces do |t|
      t.references :room, foreign_key: true, null: false
      t.references :available_space, foreign_key: true, null: false
      t.timestamps
    end
    add_index      :room_available_spaces, [:room_id, :available_space_id]
  end
end
