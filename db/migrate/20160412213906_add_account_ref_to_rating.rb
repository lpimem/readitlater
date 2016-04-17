class AddAccountRefToRating < ActiveRecord::Migration
  def change
  	add_reference :ratings, :account, index: true, foreign_key: true
  end
end
