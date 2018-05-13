class CreateSafetyAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :safety_amenities do |t|
      t.string :content, null: false, unique: true
      t.text   :description
      t.timestamps
    end
  end
end
