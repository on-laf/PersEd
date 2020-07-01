class Teacher < ApplicationRecord
  belongs_to :user
  has_many :flashcard_sets
  has_many :teacher_subjects
  has_many :subjects, through: :teacher_subjects
  validates :first_name, :last_name, presence: true
end
