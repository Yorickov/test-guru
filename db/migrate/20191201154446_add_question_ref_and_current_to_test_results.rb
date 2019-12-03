class AddQuestionRefAndCurrentToTestResults < ActiveRecord::Migration[6.0]
  def change
    add_column :test_results, :correct_questions, :integer, default: 0
    add_reference :test_results, :question, foreign_key: true
  end
end
