class Message < ApplicationRecord
  belongs_to :send_user, class_name: 'User', :foreign_key => 'send_user_id'
  belongs_to :receive_user, class_name: 'User', :foreign_key => 'receive_user_id'

  enum kind: { unread: 0, already_read: 1, star: 2, appointment: 3 }
  validates :message, presence: true
end
