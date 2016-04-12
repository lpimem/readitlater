class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
    add_reference :followships, :user, index: true, foreign_key: true
    add_column :followships, :account, :string
    add_column :followers, :user, :string
  end
end
