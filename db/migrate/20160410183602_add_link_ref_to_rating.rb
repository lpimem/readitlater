class AddLinkRefToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :link_id, index: true, foreign_key: true
  end
end
