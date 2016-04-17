class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value, default: 0, null: false

      t.timestamps null: false
    end
  end
end
