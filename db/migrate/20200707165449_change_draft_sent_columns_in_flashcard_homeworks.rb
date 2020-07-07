class ChangeDraftSentColumnsInFlashcardHomeworks < ActiveRecord::Migration[6.0]
  def change
    remove_column :flashcard_homeworks, :sent?, :boolean
    add_column :flashcard_homeworks, :sent, :boolean, default: false
    remove_column :flashcard_homeworks, :draft?, :boolean
    add_column :flashcard_homeworks, :draft, :boolean, default: true
  end
end
