class ChangeColumsQuestionAndAnswerToTextInFlashcardTemplate < ActiveRecord::Migration[6.0]
  def change
    change_column :flashcard_templates, :question, :text
    change_column :flashcard_templates, :answer, :text
  end
end
