class DropTestPassages < ActiveRecord::Migration[6.0]
  def up
    drop_table :test_passages, if_exists: true
  end

  def down; end
end
