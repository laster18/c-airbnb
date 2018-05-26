class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text        :message, null: false
      t.integer     :send_user_id, null: false
      t.integer     :receive_user_id, null: false
      t.integer     :kind, null: false, default: 0
      t.timestamps
    end
  end
end
