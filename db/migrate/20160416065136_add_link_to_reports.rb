class AddLinkToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :link, index: true, foreign_key: true
  end
end
