class CreateSharedSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_spaces do |t|
      t.string :content, null: false, unique: true
      t.timestamps
    end
  end
end
