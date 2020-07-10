class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notifications

  def index; end

  def mark_as_read
    @notifications.update_all(read_at: Time.zone.now)
    if teacher?
      redirect_to teacher_path(current_teacher)
    else
      redirect_to student_path(current_student)
    end
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end
