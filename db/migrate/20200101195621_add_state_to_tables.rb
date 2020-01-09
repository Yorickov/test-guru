class AddStateToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :state, :string
    add_column :questions, :state, :string
    add_column :test_passages, :state, :string
  end
end
