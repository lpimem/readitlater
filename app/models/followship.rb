# == Schema Information
#
# Table name: followships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#


class Followship < ActiveRecord::Base
	belongs_to :followers, class_name: "Account", foreign_key: "follower_id"
	belongs_to :following, class_name: "Account", foreign_key: "following_id"
end
