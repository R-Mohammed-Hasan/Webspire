class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(object)
    p "================================================="
    p "================================================="
    p "================================================="
    p object[:message].receiver_id
    html = ApplicationController.render partial: "messages/message",
    locals: { message: object[:message], current_user_id: object[:current_user_id] }
    ActionCable.server.broadcast "room_channel_#{object[:message].receiver_id}}", html: "html"
    p "================================================="
    p "================================================="

  end
end
