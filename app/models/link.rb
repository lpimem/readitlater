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
#  account_id  :integer
#




class Link < ActiveRecord::Base

	validates :url, presence: true, format: { with: /\Ahttps?:\/\/.+/i }
	validates :title, presence: true
	validates :level, presence: true,numericality: { greater_than_or_equal_to:0 , less_than_or_equal_to:2}
	validates :description, presence: true, length: { maximum: 100}

	has_many :reports
	has_many :ratings
	belongs_to :user, class_name: "account", foreign_key: "account_id"

	has_many :comments
end
