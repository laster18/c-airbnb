class RoomAppointment < ApplicationRecord
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :message, presence: true
end
