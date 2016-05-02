class AddLinkRefToRating < ActiveRecord::Migration
  def change
  	add_reference :ratings, :link, index: true, foreign_key: true
  end
end
