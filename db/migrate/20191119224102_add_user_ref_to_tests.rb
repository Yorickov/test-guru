class AddUserRefToTests < ActiveRecord::Migration[6.0]
  def up
    add_reference :tests, :user, null: true, foreign_key: true
    change_column_null :tests, :user_id, false
  end

  def down
    remove_column :tests, :user_id
  end
end
