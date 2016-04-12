# == Schema Information
#
# Table name: followships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Followship < ActiveRecord::Base

	belongs_to :account, class_name: "Account", foreign_key: "usr_id"
	has_many :follower, class_name: "Account", foreign_key: "usr_id"
	
end
