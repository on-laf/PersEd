class Topic < ApplicationRecord
  belongs_to :subject

  def to_s
    topic_name
  end
end
