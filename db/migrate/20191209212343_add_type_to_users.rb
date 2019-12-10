class AddTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true
    add_index :users, :type
  end
end
