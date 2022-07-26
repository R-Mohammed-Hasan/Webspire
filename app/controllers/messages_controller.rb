class MessagesController < ApplicationController

  layout "home"

  def message
    messages = Chatting.where("(sender_id = ? or sender_id = ?) and (receiver_id = ? or receiver_id = ?)",@current_user.id , params[:id],params[:id], @current_user.id)
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends,messages: messages}
  end

  def create
    messages = Chatting.where("(sender_id = ? or sender_id = ?) and (receiver_id = ? or receiver_id = ?)",@current_user.id , params[:id],params[:id], @current_user.id)
    friends = @current_user.friends
    message = Chatting.create(sender_id: @current_user.id, receiver_id: params[:id], message: params[:input])
    SendMessageJob.perform_later({message: message, current_user_id: @current_user.id})
    # ActionCable.server.broadcast "room_channel_#{message.receiver_id}", html: "hi"
  end

end
