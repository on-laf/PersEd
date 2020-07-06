class StudentFlashcardSet < ApplicationRecord
  belongs_to :student
  belongs_to :flashcard_homework
  has_many :student_flashcards
end
