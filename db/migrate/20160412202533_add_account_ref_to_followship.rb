class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
   add_column :followships, :following_id, :reference
   add_column :followships, :follower_id, :reference
  end
end
