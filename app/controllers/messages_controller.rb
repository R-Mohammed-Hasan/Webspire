# frozen_string_literal: true

class MessagesController < ApplicationController
  layout 'home'

  def show
    friends = @current_user.friends
    render 'messages/message', locals: { friends: friends }
  end

  def message
    if (params[:id].split('_')[0] == @current_user.id.to_s) || (params[:id].split('_')[1] == @current_user.id.to_s)
      messages = Chatting.where(room_id: params[:id])
      p 'fetching',getRoom(params[:id])
      friends = @current_user.friends
      render 'messages/message', locals: { friends: friends, messages: messages }
    end
  end

  def create
    message = Chatting.create(sender_id: @current_user.id, room_id: getRoom(params[:id]), message: params[:input])
    p 'getRoom(params[:id]) inside create ', getRoom(params[:id])
    SendMessageJob.perform_later(message)
    # ActionCable.server.broadcast "room_channel_13_14" , message: "hello"

  end

  def getRoom(room_id)
    room_id = room_id.split('_')
    room_id[0].to_i < room_id[1].to_i ? room_id.join('_') : room_id.reverse.join('_')
  end
end
