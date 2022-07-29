class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    request = ApplicationController.render partial: "messages/request",
    locals: { message: message }

    response = ApplicationController.render partial: "messages/response",
    locals: { message: message }

    ActionCable.server.broadcast "room_channel_#{message.sender_id}",
    request: request,
    response: response,
    message: message
  end

end
