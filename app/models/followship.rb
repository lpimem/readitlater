# == Schema Information
#
# Table name: followships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  usr_id_id  :integer
#

class Followship < ActiveRecord::Base

	belongs_to :account, class_name: "Account", foreign_key: "user"
	has_many :follower, class_name: "Account", foreign_key: "user"
	
end
