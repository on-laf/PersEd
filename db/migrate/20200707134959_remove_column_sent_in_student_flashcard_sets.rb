class RemoveColumnSentInStudentFlashcardSets < ActiveRecord::Migration[6.0]
  def change
    remove_column :student_flashcard_sets, :sent, :boolean
  end
end
