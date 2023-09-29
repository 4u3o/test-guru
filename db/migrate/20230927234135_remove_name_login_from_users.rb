class RemoveNameLoginFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_columns :users, :name, :login
  end
end
