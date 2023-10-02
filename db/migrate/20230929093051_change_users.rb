class ChangeUsers < ActiveRecord::Migration[6.1]
  change_table :users do |t|
    t.string :password_digest
    t.remove :login, :name
    t.index :email, unique: true
  end
end
