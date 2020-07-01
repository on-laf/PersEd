class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teacher_subjects
  validates :first_name, :last_name, presence: true
end
