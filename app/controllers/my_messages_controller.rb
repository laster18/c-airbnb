class MyMessagesController < ApplicationController
  def index
    @messages = Message.where(receive_user_id: current_user.id)
  end

  def show

  end
end
