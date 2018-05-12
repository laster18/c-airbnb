class SafetyAmenity < ApplicationRecord
  has_many :room_safety_amenities
  has_many :rooms, through: :room_safety_amenities
end
