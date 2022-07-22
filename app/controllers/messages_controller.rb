class MessagesController < ApplicationController

layout "home"
  def message
    @messages = Chatting.where("(sender_id = ? or sender_id = ?) and (receiver_id = ? or receiver_id = ?)",@current_user.id , params[:id],params[:id], @current_user.id)
    @friends = @current_user.friends
  end

  def create
    message = Chatting.create(sender_id: @current_user.id, receiver_id: params[:id], message: params[:input])
    ActionCable.server.broadcast "room_channel_#{params[:id]}", message: params[:input]
  end

end
