class CreateFlashcardHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcard_homeworks do |t|
      t.string :name
      t.datetime :due_date
      t.references :group, null: false, foreign_key: true
      t.references :flashcard_set, null: false, foreign_key: true
      t.boolean :draft?, default: true

      t.timestamps
    end
  end
end
