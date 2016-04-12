# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ActiveRecord::Base
	
	belongs_to :link
	belongs_to :account, class_name:"Account", foreign_key: "usr_id"

	validates :value, presence: true
	
end
