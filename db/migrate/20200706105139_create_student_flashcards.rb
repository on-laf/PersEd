class CreateStudentFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :student_flashcards do |t|
      t.text :question
      t.text :answer
      t.text :student_answer
      t.text :feedback
      t.boolean :completed, default: false
      t.references :flashcard_template, null: false, foreign_key: true
      t.references :student_flashcard_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
