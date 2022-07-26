class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)

    request = ApplicationController.render partial: "messages/request",
    locals: { message: message }
    p "============================="
    p "============================="
    p "============================="
    p request
    response = ApplicationController.render partial: "messages/response",
    locals: { message: message }
    p "============================="
    p "============================="
    p "============================="
    p response
    ActionCable.server.broadcast "room_channel_#{message.receiver_id}",
    request: request,
    response: response,
    message: message
  end

end
