class CreateRoomRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :room_requirements do |t|
      t.references :room, foreign_key: true, null: false
      t.references :requirement, foreign_key: true, null: false
      t.timestamps
    end
    add_index      :room_requirements, [:room_id, :requirement_id]
  end
end
