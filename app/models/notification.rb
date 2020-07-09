class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true
  belongs_to :object, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
end
