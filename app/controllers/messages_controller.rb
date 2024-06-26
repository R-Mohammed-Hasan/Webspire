# frozen_string_literal: true

class MessagesController < ApplicationController
  layout 'home'

  def show
    friends = @current_user.friends
    render 'messages/message', locals: { friends: friends }
  end

  def message
    if (params[:id].split('_')[0] == @current_user.id.to_s) || (params[:id].split('_')[1] == @current_user.id.to_s)
      messages = Chatting.where(room_id: getRoom(params[:id]))
      friends = @current_user.friends
      render 'messages/message', locals: { friends: friends, messages: messages }
    end
  end

  def create
    message = Chatting.create(sender_id: @current_user.id, room_id: getRoom(params[:id]), message: params[:input])
    SendMessageJob.perform_later(message)
  end

  def getRoom(room_id)
    room_id[0].to_i < room_id[2].to_i ? room_id : room_id.reverse
  end
end
