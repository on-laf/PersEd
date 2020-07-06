class Topic < ApplicationRecord
  belongs_to :subject
  has_many :flashcard_templates
  validates :topic_name, presence: true

  def to_s
    topic_name
  end
end
