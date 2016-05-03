class AddAccountRefToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :account, index: true, foreign_key: true
  end
end
