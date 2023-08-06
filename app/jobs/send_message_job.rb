# frozen_string_literal: true

class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    request = ApplicationController.render partial: 'messages/request',
                                           locals: { message: message }

    response = ApplicationController.render partial: 'messages/response',
                                            locals: { message: message }
    ActionCable.server.broadcast "room_channel_#{getRoom(message.room_id)}",
                                 request: request,
                                 response: response,
                                 message: message
  end

  def getRoom(room_id)
    room_id = room_id.split('_')
    room_id[0].to_i < room_id[1].to_i ? room_id.join('_') : room_id.reverse.join('_')
  end
end
