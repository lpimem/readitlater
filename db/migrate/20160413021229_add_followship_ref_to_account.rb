class AddFollowshipRefToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :followers, index: true, foreign_key: true
  end
end
