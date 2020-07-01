class CreateStudentsGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :students_groups do |t|
      t.references :groups, null: false, foreign_key: true
      t.references :students, null: false, foreign_key: true

      t.timestamps
    end
  end
end
