class CreateRoomImages < ActiveRecord::Migration[5.0]
  def change
    create_table :room_images do |t|
      t.string :image, null: false
      t.references :room, foreign_key: true, null: false
      t.timestamps
    end
  end
end
