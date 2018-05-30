class MyMessagesController < ApplicationController
  def index
    @messages = Message.where(receive_user_id: current_user.id).order("created_at DESC")
    @user_ids = @messages.pluck(:send_user_id) # 送り主のuser_idを配列で取得
    @user_ids = @user_ids.uniq                 # 重複の削除
    @new_messages = []
    @user_ids.each do |user_id|
      @new_messages << @messages.find_by(send_user_id: user_id)
    end
  end

  def show
    @receive_messages = Message.where(receive_user_id: current_user.id, send_user_id: params[:id])
    @send_messages = Message.where(receive_user_id: params[:id], send_user_id: current_user.id)
    @messages = @receive_messages + @send_messages
    @messages = @messages.sort { |a, b| a[:created_at] <=> b[:created_at] }
    @receive_user = User.find(params[:id])  #送る相手の情報
    @message = Message.new

    kind_update(@receive_messages) # kindをalready_readにするメソッド
  end

  private
  def kind_update(messages)
    messages.each do |message|
      message.update(kind: 'already_read')
    end
  end
end
