class Room < ApplicationRecord
  # アソシエーション
  has_many :shared_spaces, through: :room_shared_spaces
  has_many :room_shared_spaces
  has_many :amenities, through: :room_amenities
  has_many :room_amenities
  has_many :safety_amenities, through: :room_safety_amenities
  has_many :room_safety_amenities
  has_many :available_spaces, through: :room_available_spaces
  has_many :room_available_spaces
  has_many :requirements, through: :room_requirements
  has_many :room_requirements
  has_many :notices, through: :room_notices
  has_many :room_notices
  has_many :notice_descriptions, through: :room_notices
  has_many :recommendations, through: :room_recommendations
  has_many :room_recommendations

  has_many :room_calendars
  has_many :room_images

  has_one :house_rule

  belongs_to :room_category
  belongs_to :room_building_type
  belongs_to :room_bathroom
  belongs_to :room_deadline

  # enum管理

  enum room_type: { entire_home: 0, private_room: 1, shared_room: 2 }
end
