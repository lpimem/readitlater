class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|

      t.timestamps null: false
    end
  end
end
