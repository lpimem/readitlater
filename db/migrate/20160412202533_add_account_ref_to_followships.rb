class AddAccountRefToFollowships < ActiveRecord::Migration
  def change
   add_reference :followships, :following
   add_reference :followships, :follower
  end
end
