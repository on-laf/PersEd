class StudentFlashcard < ApplicationRecord
  belongs_to :flashcard_template, optional: true
  belongs_to :student_flashcard_set
end
