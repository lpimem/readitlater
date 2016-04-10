class AddFollowshipRefToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :followship_id, index: true, foreign_key: true
  end
end
