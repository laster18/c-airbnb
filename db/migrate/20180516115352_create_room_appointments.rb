class CreateRoomAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :room_appointments do |t|
      t.references :room, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.date       :check_in_date, null: false
      t.date       :check_out_date, null: false
      t.integer    :number_of_adult, null: false, default: 1
      t.integer    :number_of_child, null: false, default: 0
      t.integer    :number_of_infant, null: false, default: 0
      t.text       :message, null: false
      t.integer    :total_fee, null: false
      t.timestamps
    end
  end
end
