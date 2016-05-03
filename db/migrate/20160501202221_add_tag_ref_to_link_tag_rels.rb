class AddTagRefToLinkTagRels < ActiveRecord::Migration
  def change
    add_reference :link_tag_rels, :tag, index: true, foreign_key: true
  end
end
