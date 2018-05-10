class CreateHouseRules < ActiveRecord::Migration[5.0]
  def change
    create_table :house_rules do |t|
      t.boolean :child_permission, default: false
      t.text :child_not_reason
      t.boolean :infant_permission, default: false
      t.text :infant_not_reason
      t.boolean :pet_permission, default: false
      t.boolean :party_permission, default: false
      t.references :room, foreign_key: true, null: false
      t.timestamps
    end
  end
end
