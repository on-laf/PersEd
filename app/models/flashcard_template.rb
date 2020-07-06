class FlashcardTemplate < ApplicationRecord
  belongs_to :teacher
  belongs_to :flashcard_set
  belongs_to :topic
  validates :question, :answer, presence: true
end
