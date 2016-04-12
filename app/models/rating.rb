# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id_id :integer
#  usr_id_id  :integer
#

class Rating < ActiveRecord::Base
	
	belongs_to :link
	belongs_to :account, class_name:"Account", foreign_key: "user"

	validates :value, presence: true
	
end
