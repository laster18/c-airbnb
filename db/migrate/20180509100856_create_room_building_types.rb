class CreateRoomBuildingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :room_building_types do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
