class Message < ApplicationRecord
  belongs_to :send_user, class_name: 'User', :foreign_key => 'send_user_id'
  belongs_to :receive_user, class_name: 'User', :foreign_key => 'receive_user_id'

  enum kind: { star: 0, unread: 1, already_read: 2, appointment: 3 }
end
