class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img, null: false
      t.string :rule, null: false
      t.string :rule_value, null: false

      t.timestamps

      t.index :title, unique: true
    end
  end
end
