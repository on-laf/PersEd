class AddFlashcardTemplateToStudentFlashcards < ActiveRecord::Migration[6.0]
  def change
    remove_reference :student_flashcards, :flashcard_template, foreign_key: true
    add_reference :student_flashcards, :flashcard_template, null: true, foreign_key: true
  end
end
