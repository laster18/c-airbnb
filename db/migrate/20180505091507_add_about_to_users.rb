class AddAboutToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :about, :text
    add_column :users, :current_city, :string
  end
end
