class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
    add_reference :followships, :user, index: true, foreign_key: true
  end
end
