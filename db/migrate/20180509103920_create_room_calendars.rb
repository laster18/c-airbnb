class CreateRoomCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :room_calendars do |t|
      t.date :date, null: false
      t.references :room, foreign_key: true, null: false
      t.timestamps
    end
  end
end
