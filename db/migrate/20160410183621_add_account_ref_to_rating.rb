class AddAccountRefToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :usr_id, index: true, foreign_key: true
  end
end
