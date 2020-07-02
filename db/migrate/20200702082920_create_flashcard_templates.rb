class CreateFlashcardTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcard_templates do |t|
      t.string :question
      t.string :answer
      t.references :teacher, null: false, foreign_key: true
      t.references :flashcard_set, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
