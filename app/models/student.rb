class Student < ApplicationRecord
  belongs_to :user
  has_many :students_groups, dependent: :destroy
  has_many :groups, through: :students_groups
  has_many :flashcard_homeworks, through: :groups
  has_many :student_flashcard_sets
  has_many :student_flashcards, through: :student_flashcard_sets
  validates :first_name, :last_name, presence: true
end
