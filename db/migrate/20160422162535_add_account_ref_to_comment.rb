class AddAccountRefToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :account, index: true, foreign_key: true
  end
end
