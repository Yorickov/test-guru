class AddEmailUniqueIndexToUsers < ActiveRecord::Migration[6.0]
  def up
    remove_index :users, :email
    add_index :users, :email, unique: true
  end

  def down
    remove_index :users, :email, unique: true
    add_index :users, :email
  end
end
