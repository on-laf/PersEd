class FixGroupStudents < ActiveRecord::Migration[6.0]
  def change
    rename_column :students_groups, :groups_id, :group_id
    rename_column :students_groups, :students_id, :student_id
  end
end
