class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
    add_reference :followships, :follower, index: true, foreign_key: true
    add_reference :followships, :following, index: true, foreign_ket: true
#    add_column :followships, :following, :string
#    add_column :followships, :follower, :string
  end
end
