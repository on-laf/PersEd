class Topic < ApplicationRecord
  belongs_to :subject
  has_many :flashcard_templates
end
