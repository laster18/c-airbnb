class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_type, null: false
      t.integer :person_capacity, null: false
      t.text :address, null: false
      t.boolean :only_for_guest, default: false
      t.integer :bedroom_number, null: false
      t.integer :bed_number, null: false
      t.string :check_in_from, null: false
      t.string :check_in_to, null: false
      t.integer :min_lodging, null: false
      t.integer :max_lodging, null: false
      t.integer :day_fee, null: false
      t.integer :experience, null: false
      t.integer :frequency, null: false
      t.string :title, null: false
      t.text :overview, null: false
      t.timestamps
    end
  end
end
