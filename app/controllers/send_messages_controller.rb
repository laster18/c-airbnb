class SendMessagesController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @receive_user = @room.user
    @send_message = Message.new
  end

  def create
    binding.pry
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy

  end

  private
  def message_params
    params.require(:send_message).permit(:title, :message).merge(send_user_id: current_user.id)
  end
end
