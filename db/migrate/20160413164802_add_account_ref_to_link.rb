class AddAccountRefToLink < ActiveRecord::Migration
  def change
    add_reference :links, :account, index: true, foreign_key: true
  end
end
