class CreateStudentFlashcardSets < ActiveRecord::Migration[6.0]
  def change
    create_table :student_flashcard_sets do |t|
      t.references :student, null: false, foreign_key: true
      t.references :flashcard_homework, null: false, foreign_key: true
      t.boolean :sent, default: false
      t.boolean :submitted, default: false

      t.timestamps
    end
  end
end
