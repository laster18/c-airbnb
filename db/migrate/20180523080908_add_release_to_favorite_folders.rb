class AddReleaseToFavoriteFolders < ActiveRecord::Migration[5.0]
  def change
    add_column :favorite_folders, :release, :boolean, default: 1, null: false
  end
end
