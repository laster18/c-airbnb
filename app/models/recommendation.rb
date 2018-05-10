class Recommendation < ApplicationRecord
  has_many :rooms, through: :room_recommendations
  has_many :room_recommendations
end
