class FlashcardHomework < ApplicationRecord
  belongs_to :group
  belongs_to :flashcard_set
  has_many :student_flashcard_sets
end
