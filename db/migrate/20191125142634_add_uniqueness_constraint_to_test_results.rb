class AddUniquenessConstraintToTestResults < ActiveRecord::Migration[6.0]
  def up
    remove_index :test_results, :test_id
    remove_index :test_results, :user_id

    add_index :test_results, [:test_id, :user_id], unique: true
  end

  def down
    remove_index :test_results, [:test_id, :user_id]

    add_index :test_results, :test_id
    add_index :test_results, :user_id
  end
end
