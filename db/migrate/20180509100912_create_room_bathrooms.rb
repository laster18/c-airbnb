class CreateRoomBathrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :room_bathrooms do |t|
      t.integer :number, null: false
      t.boolean :only_for_guest, default: false
      t.timestamps
    end
  end
end
