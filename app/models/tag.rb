# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  has_many :link_tag_rels
  has_many :links, through: :link_tag_rels
  # validations
  validates :label,
    uniqueness: true,
    length: {
      minimum: 1,
      maximum: 36
    },
    presence: true,
    format: {
      with: /[\w\d_]+/,
      message: "only allows letters, digits and underscores(_)"
    }
end
