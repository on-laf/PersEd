class Teacher < ApplicationRecord
  belongs_to :user
  has_many :groups, dependent: :destroy
  has_many :teacher_subjects, dependent: :destroy
  has_many :subjects, through: :teacher_subjects
  has_many :flashcard_sets
  has_many :flashcard_templates
  validates :first_name, :last_name, presence: true
end
