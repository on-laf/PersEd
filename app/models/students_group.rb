class StudentsGroup < ApplicationRecord
  belongs_to :student
  has_many :groups
end
