class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_type
      t.integer :person_capacity
      t.text :address
      t.boolean :only_for_guest, default: false
      t.integer :bedroom_number
      t.integer :bed_number
      t.string :check_in_from
      t.string :check_in_to
      t.integer :min_lodging
      t.integer :max_lodging
      t.integer :day_fee
      t.integer :experience
      t.integer :frequency
      t.boolean :child_permission, default: false
      t.text :child_not_reason
      t.boolean :infant_permission, default: false
      t.text :infant_not_reason
      t.boolean :pet_permission, default: false
      t.boolean :party_permission, default: false
      t.timestamps
    end
  end
end
