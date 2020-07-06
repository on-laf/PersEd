class FlashcardHomework < ApplicationRecord
  belongs_to :group
  belongs_to :flashcard_set
end
