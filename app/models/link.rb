# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  url         :string
#  title       :string
#  description :string
#  level       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#



class Link < ActiveRecord::Base

	validates :url, presence: true, format: { with: /\Ahttps?:\/\/.+/i }
	validates :title, presence: true
	validates :level, presence: true,numericality: { greater_than_or_equal_to:1 , less_than_or_equal_to:3}
	validates :description, presence: true, length: { maximum: 100}

	has_many :reports
end
