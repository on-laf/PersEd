class StudentsGroup < ApplicationRecord
  belongs_to :student
  belongs_to :group
  # after_create :create_event

  # def create_event

  # end
end
