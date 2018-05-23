class Favorite < ApplicationRecord
  belongs_to :favorite_folder
  belongs_to :room
end
