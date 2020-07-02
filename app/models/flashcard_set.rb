class FlashcardSet < ApplicationRecord
  belongs_to :teacher
  has_many :flashcard_templates
end
