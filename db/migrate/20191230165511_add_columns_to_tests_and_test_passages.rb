class AddColumnsToTestsAndTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_limit, :integer, default: 0
    add_column :test_passages, :test_time, :integer
  end
end
