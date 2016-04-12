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
	
	belongs_to :user, class_name: "account", foreign_key: "user"
	belongs_to :link

end
