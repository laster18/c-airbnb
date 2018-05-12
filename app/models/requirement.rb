class Requirement < ApplicationRecord
  has_many :room_requirements
  has_many :rooms, through: :room_requirements
end
