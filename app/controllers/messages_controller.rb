class MessagesController < ApplicationController

  layout "home"

  def show
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends}
  end

  def message
    messages = Chatting.where("(sender_id = ? or sender_id = ?) and (receiver_id = ? or receiver_id = ?)",@current_user.id , params[:id],params[:id], @current_user.id)
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends,messages: messages}
  end


  def create
    message = Chatting.create(sender_id: @current_user.id, receiver_id: params[:id], message: params[:input])
    messages = Chatting.where("(sender_id = ? or sender_id = ?) and (receiver_id = ? or receiver_id = ?)",@current_user.id , params[:id],params[:id], @current_user.id)
    SendMessageJob.perform_later(message)
  end

end
