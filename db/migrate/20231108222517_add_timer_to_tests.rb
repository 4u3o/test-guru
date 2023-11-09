class AddTimerToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :string, null: true
  end
end
