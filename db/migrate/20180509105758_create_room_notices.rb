class CreateRoomNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :room_notices do |t|
      t.references :room, foreign_key: true, null: false
      t.references :notice, foreign_key: true, null: false
      t.timestamps
    end
    add_index      :room_notices, [:room_id, :notice_id]
  end
end
