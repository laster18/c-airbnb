class CreateRoomSharedSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :room_shared_spaces do |t|
      t.references :room, foreign_key: true, null: false
      t.references :shared_space, foreign_key: true, null: false
      t.timestamps
    end
  end
end
