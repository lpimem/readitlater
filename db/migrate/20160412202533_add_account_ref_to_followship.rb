class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
    # add_reference :followships, :account, index: true, foreign_key: true
#    add_reference :followships, :follower, index:true, foreign_ket: true
   add_column :followships, :following_id, :reference
   add_column :followships, :follower_id, :reference
  end
end
