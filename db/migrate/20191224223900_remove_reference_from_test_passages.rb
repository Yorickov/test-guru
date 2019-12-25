class RemoveReferenceFromTestPassages < ActiveRecord::Migration[6.0]
  def up
      remove_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
      add_column :test_passages, :current_question_id, :integer
      add_index :test_passages, :current_question_id
    end

    def down
      remove_index :test_passages, :current_question_id
      remove_column :test_passages, :current_question_id, :integer
      add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
    end
end
