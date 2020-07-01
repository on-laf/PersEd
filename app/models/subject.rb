class Subject < ApplicationRecord
  has_many :topics
  has_many :teacher_subjects
end
