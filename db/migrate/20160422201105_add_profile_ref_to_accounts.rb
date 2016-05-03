class AddProfileRefToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :profile, index: true, foreign_key: true
  end
end
