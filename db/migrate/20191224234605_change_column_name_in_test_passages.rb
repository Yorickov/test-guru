class ChangeColumnNameInTestPassages < ActiveRecord::Migration[6.0]
  def up
    remove_index :test_passages, :current_question_id
    rename_column :test_passages, :current_question_id, :question_id
    add_index :test_passages, :question_id
  end

  def down
    remove_index :test_passages, :question_id
    rename_column :test_passages, :question_id, :current_question_id
    add_index :test_passages, :current_question_id
  end
end
