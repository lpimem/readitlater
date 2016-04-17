# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#

class Report < ActiveRecord::Base
    #validations	
    validates :reason, presence: true 
    belongs_to :link 
end
