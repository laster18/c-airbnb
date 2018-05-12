class AddFirstNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :birthday_month, :integer, null: false
    add_column :users, :birthday_day, :integer, null: false
    add_column :users, :birthday_year, :integer, null: false
    add_column :users, :gender, :integer, default: 3
    add_column :users, :native_currency, :string
    add_column :users, :preferred_locale, :string
    add_column :users, :tel_number, :integer
  end
end

