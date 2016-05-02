class AddLinkRefToLinkTagRels < ActiveRecord::Migration
  def change
    add_reference :link_tag_rels, :link, index: true, foreign_key: true
  end
end
