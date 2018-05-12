class Recommendation < ApplicationRecord
  has_many :room_recommendations
  has_many :rooms, through: :room_recommendations
end
