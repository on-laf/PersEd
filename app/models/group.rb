class Group < ApplicationRecord
  belongs_to :teacher
  has_many :students_groups, dependent: :destroy
  has_many :students, through: :students_groups
  has_many :flashcard_homeworks
  validates :class_name, presence: true

  def to_s
    class_name
  end
end
