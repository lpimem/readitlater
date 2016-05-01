# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  account_id :integer
#

class Comment < ActiveRecord::Base
	belongs_to :account, class_name: "account", foreign_key: "account_id"
	belongs_to :link, class_name: "link", foreign_key: "link_id"
end
