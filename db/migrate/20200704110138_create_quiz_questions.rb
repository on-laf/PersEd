class CreateQuizQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_questions do |t|
      t.string :question
      t.integer :correct_answer
      t.string :A
      t.string :B
      t.string :C
      t.string :D
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
