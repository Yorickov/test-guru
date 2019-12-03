class RemoveUniqueConstraintFromTestPassages < ActiveRecord::Migration[6.0]
  def up
    remove_index :test_passages, [:test_id, :user_id]
  end

  def down
    add_index :test_passages, [:test_id, :user_id], unique: true
  end
end
