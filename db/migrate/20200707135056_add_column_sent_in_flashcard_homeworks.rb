class AddColumnSentInFlashcardHomeworks < ActiveRecord::Migration[6.0]
  def change
    add_column :flashcard_homeworks, :sent?, :boolean, default: false
  end
end
