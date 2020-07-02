class Topic < ApplicationRecord
  belongs_to :subject
  has_many :flashcard_templates
  
  def to_s
    topic_name
  end
end
