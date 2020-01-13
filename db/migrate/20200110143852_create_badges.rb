class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.string :filename
      t.string :rule_name
      t.string :rule_param

      t.timestamps
    end
  end
end
