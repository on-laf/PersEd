class Group < ApplicationRecord
  belongs_to :teacher
  has_many :students_groups

  def to_s
    class_name
  end
end
