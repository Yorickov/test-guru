class ChangeColumnToTestPasseges < ActiveRecord::Migration[6.0]
  def up
    remove_reference :test_passages, :current_question, foreign_key: true
    add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
  end

  def down
    remove_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
    add_reference :test_passages, :current_question, foreign_key: true
  end
end
