class AddAccountRefToFollowship < ActiveRecord::Migration
  def change
    add_reference :followships, :usr_id, index: true, foreign_key: true
  end
end
