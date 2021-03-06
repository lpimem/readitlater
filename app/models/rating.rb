# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  value      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  account_id :integer
#

class Rating < ActiveRecord::Base
	
	belongs_to :user, class_name: "account", foreign_key: "account_id"
	belongs_to :link, class_name: "link", foreign_key: "link_id"

end
