class ChatController < ApplicationController
  def index

  end

  def load_conversation
    @user = User.find(params[:id])
    @messages = Message.all_messages_of(current_user, @user)
    render layout: false
  end

  def send_message
    @user = User.find(params[:id])
    @message = Message.create({sender: current_user, reciever: @user, message: params[:message]})
    render json: true
  end
end
