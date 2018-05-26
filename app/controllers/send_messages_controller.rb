class SendMessagesController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @receive_user = @room.user
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end
    else
      @receive_user = User.find(params[:user_id])
      render :new
    end
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit( :message).merge(send_user_id: current_user.id, receive_user_id: params[:user_id])
  end
end
