class FlashcardSet < ApplicationRecord
  belongs_to :teacher
  has_many :flashcard_templates, dependent: :destroy
  has_many :flashcard_homeworks
  validates :name, presence: true
end
