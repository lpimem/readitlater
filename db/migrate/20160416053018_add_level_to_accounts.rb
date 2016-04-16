class AddLevelToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :level, :integer
  end
end
