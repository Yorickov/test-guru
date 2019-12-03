class DropTableTestResults < ActiveRecord::Migration[6.0]
  def up
    drop_table :test_results, if_exists: true
  end
end
