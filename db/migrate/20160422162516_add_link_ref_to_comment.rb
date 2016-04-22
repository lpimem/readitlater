class AddLinkRefToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :link, index: true, foreign_key: true
  end
end
