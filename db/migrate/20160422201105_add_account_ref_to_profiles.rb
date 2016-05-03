class AddAccountRefToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :account, index: true, foreign_key: true
  end
end
