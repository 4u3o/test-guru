class CreateTestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_users, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
