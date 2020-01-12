class AddIndexToBadges < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :name, :title
    add_index :badges, [:rule_name, :rule_param]
  end
end
