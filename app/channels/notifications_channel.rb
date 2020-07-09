class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # not sure this makes sense...
    stream_from "notifications:#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
