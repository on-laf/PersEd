class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def mark_as_read
    @notifications.update_all(read_at: Time.zone.now)
    render json: { sucess: true }, status: :ok
  end
end
