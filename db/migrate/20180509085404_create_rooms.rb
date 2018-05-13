class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_type
      t.integer :person_capacity
      t.boolean :only_for_guest, default: false
      t.integer :bedroom_number
      t.integer :bed_number
      t.integer :bathroom_number
      t.string :check_in_from
      t.string :check_in_to
      t.integer :min_lodging
      t.integer :max_lodging
      t.integer :day_fee
      t.integer :experience
      t.integer :frequency
      t.string :title
      t.text :overview
      t.integer :country
      t.integer :zipcode
      t.text :state
      t.text :city
      t.text :street
      t.text :apartment
      t.timestamps
    end
  end
end
