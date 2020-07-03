class Group < ApplicationRecord
  belongs_to :teacher
  has_many :students_groups, dependent: :destroy
  has_many :students, through: :students_groups

  def to_s
    class_name
  end
end
