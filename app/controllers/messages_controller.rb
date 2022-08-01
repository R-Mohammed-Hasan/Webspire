class MessagesController < ApplicationController

  layout "home"

  def show
<<<<<<< HEAD
=======
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends}
  end

  def message
    messages = Chatting.where(room_id: getRoom(params[:id]))
>>>>>>> bb13e75147763f67ff7f29a8817fa78b2f414971
    friends = @current_user.friends
    render "messages/message",locals: {friends: friends}
  end

<<<<<<< HEAD
  def message
    if params[:id].split("_")[0] == @current_user.id.to_s or params[:id].split("_")[1] == @current_user.id.to_s
      messages = Chatting.where(room_id: getRoom(params[:id]))
      friends = @current_user.friends
      render "messages/message",locals: {friends: friends,messages: messages}
    end
  end

=======
>>>>>>> bb13e75147763f67ff7f29a8817fa78b2f414971

  def create
    message = Chatting.create(sender_id: @current_user.id, room_id: getRoom(params[:id]), message: params[:input])
    messages = Chatting.where(room_id: getRoom(params[:id]))
    SendMessageJob.perform_later(message)
  end

  def getRoom(room_id)
    return room_id[0].to_i < room_id[2].to_i ? room_id : room_id.reverse()
  end

end
