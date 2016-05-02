class Tag < ActiveRecord::Base
  has_many :link_tag_rels
  has_many :links, through: :link_tag_rels
end
