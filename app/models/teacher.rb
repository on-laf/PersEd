class Teacher < ApplicationRecord
  belongs_to :user
  has_many :flashcard_sets
  validates :first_name, :last_name, presence: true
end
