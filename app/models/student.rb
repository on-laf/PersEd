class Student < ApplicationRecord
  belongs_to :user
  has_many :students_groups, dependent: :destroy
  has_many :groups, through: :students_groups
end
