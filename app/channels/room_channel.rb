class RoomChannel < ApplicationCable::Channel
  def subscribed
    p "======================================================="
    p params[:id]
    stream_from "room_channel_#{params[:id]}"

    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
