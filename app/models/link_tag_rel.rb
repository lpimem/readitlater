# == Schema Information
#
# Table name: link_tag_rels
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  tag_id     :integer
#

class LinkTagRel < ActiveRecord::Base
  validates :link, presence: true
  validates :tag, presence: true
  belongs_to :link
  belongs_to :tag
end
