class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question, foreign_key: true
      t.integer :correct_questions, default: 0
      t.index [:test_id, :user_id], unique: true

      t.timestamps
    end
  end
end
