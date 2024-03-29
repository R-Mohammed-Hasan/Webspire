# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
