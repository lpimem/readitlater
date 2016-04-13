# == Schema Information
#
# Table name: followships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  following  :string
#  follower   :string
#

class Followship < ActiveRecord::Base
	belongs_to :followers, class_name: "account", foreign_key: "user_id"
	belongs_to :following, class_name: "account", foreign_key: "following_id"
end
