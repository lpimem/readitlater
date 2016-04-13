class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
    add_reference :followships, :user, index: true, foreign_key: true
#    add_column :followships, :following, :string
#    add_column :followships, :follower, :string
  end
end
