class CreateSecTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :current_question_id
      t.integer :correct_questions, default: 0
      t.index :current_question_id

      t.timestamps
    end
  end
end
