class StudentFlashcard < ApplicationRecord
  belongs_to :flashcard_template
  belongs_to :student_flashcard_set
end
