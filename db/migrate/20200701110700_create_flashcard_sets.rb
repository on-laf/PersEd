class CreateFlashcardSets < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcard_sets do |t|
      t.string :name
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
