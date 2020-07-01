class Student < ApplicationRecord
  belongs_to :user
  has_many :students_groups
  has_many :study_groups, through: :students_groups
end
