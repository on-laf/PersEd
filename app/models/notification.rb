class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true
  belongs_to :object, polymorphic: true

  # after_commit -> { broadcast_messages(self, count) }

  scope :unread, -> { where(read_at: nil) }

  def count
    recipient.notifications.unread.size
  end

  # private

  # def broadcast_messages(notification, count)
  #   html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: { notification: notification, check_current_user: false }, formats: [:html]
  #   ActionCable.server.broadcast "notifications:#{notification.recipient_id}", notification: html, count: count
  # end
end
