class Quiz < ApplicationRecord
  belongs_to :teachers
  has_many :quiz_questions
end
