class Requirement < ApplicationRecord
  has_many :rooms, through: :room_requirements
  has_many :room_requirements
end
