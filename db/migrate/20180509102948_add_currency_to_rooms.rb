class AddCurrencyToRooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :currency, foreign_key: true
  end
end
