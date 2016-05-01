<<<<<<< HEAD:db/migrate/20160429230754_add_link_ref_to_reports.rb
class AddLinkRefToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :link, index: true, foreign_key: true
  end
end
=======
class AddLinkToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :link, index: true, foreign_key: true
  end
end
>>>>>>> master:db/migrate/20160416065136_add_link_to_reports.rb
