class CreateAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities do |t|
      t.string :content, null: false, unique: true
      t.timestamps
    end
  end
end
