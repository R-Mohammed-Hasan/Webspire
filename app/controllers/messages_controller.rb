class MessagesController < ApplicationController

  layout "home"

  def show
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends}
  end

  def message
    messages = Chatting.where(room_id: getRoom(params[:id]))
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends,messages: messages}
  end


  def create
    message = Chatting.create(sender_id: @current_user.id, room_id: getRoom(params[:id]), message: params[:input])
    messages = Chatting.where(room_id: getRoom(params[:id]))
    SendMessageJob.perform_later(message)
  end

  def getRoom(room_id)
    return room_id[0].to_i < room_id[2].to_i ? room_id : room_id.reverse()
  end

end
