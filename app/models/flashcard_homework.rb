class FlashcardHomework < ApplicationRecord
  belongs_to :group
  belongs_to :flashcard_set
  has_many :student_flashcard_sets
  validates :group_id, presence: true

  # not sure it's after create....
  # after_create :notification_sent

  # def notification_sent
  #   @teacher = self.teacher
  #   @group = self.group
  #   @students = self.group.students
  #   @students.each do |student|
  #     Notification.create(actor: @teacher,
  #                         recipent: student,
  #                         action: 'sent',
  #                         notifiable: @group)
  #   end
  # end
end
