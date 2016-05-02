class CreateLinkTagRels < ActiveRecord::Migration
  def change
    create_table :link_tag_rels do |t|

      t.timestamps null: false
    end
  end
end
