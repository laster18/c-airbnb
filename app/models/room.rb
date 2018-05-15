class Room < ApplicationRecord
  #アソシエーション
  has_many :room_shared_spaces, dependent: :delete_all
  has_many :shared_spaces, through: :room_shared_spaces
  has_many :room_amenities, dependent: :delete_all
  has_many :amenities, through: :room_amenities
  has_many :room_safety_amenities, dependent: :delete_all
  has_many :safety_amenities, through: :room_safety_amenities
  has_many :room_available_spaces, dependent: :delete_all
  has_many :available_spaces, through: :room_available_spaces
  has_many :room_requirements, dependent: :delete_all
  has_many :requirements, through: :room_requirements
  has_many :room_notices, dependent: :delete_all
  has_many :notices, through: :room_notices
  has_many :notice_descriptions, through: :room_notices
  has_many :room_recommendations, dependent: :delete_all
  has_many :recommendations, through: :room_recommendations

  has_many :room_calendars, dependent: :delete_all
  has_many :room_images, dependent: :delete_all

  has_one :house_rule, dependent: :destroy

  belongs_to :room_category
  belongs_to :room_building_type
  belongs_to :room_deadline
  belongs_to :user

  # enum管理
  enum room_type: { entire_home: 0, private_room: 1, shared_room: 2 }
  enum country: { japan: 0, America: 1, China: 2 }
  enum currency: { JPY: 0, USD: 1, KRW: 2 }

  monetize :day_fee_cents, with_model_currency: :currency
end
