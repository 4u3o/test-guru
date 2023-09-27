class RenameTestsUserTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :tests_users, :test_passages
  end
end
