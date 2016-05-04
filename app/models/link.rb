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
	# getter
	def tags_text
		text = nil
		if @tags
				text = @tags.map{|t| t.label}.join(", ")
		end
		text
	end
	attr_reader :tags_text
	# perfect url regex pattern by @dperini and @ixti
	PERFECT_URL_PATTERN = %r{
    \A
    # protocol identifier
    (?:(?:https?|ftp)://)
    # user:pass authentication
    (?:\S+(?::\S*)?@)?
    (?:
      # IP address exclusion
      # private & local networks
      (?!10(?:\.\d{1,3}){3})
      (?!127(?:\.\d{1,3}){3})
      (?!169\.254(?:\.\d{1,3}){2})
      (?!192\.168(?:\.\d{1,3}){2})
      (?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})
      # IP address dotted notation octets
      # excludes loopback network 0.0.0.0
      # excludes reserved space >= 224.0.0.0
      # excludes network & broacast addresses
      # (first & last IP address of each class)
      (?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])
      (?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}
      (?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))
    |
      # host name
      (?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)
      # domain name
      (?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*
      # TLD identifier
      (?:\.(?:[a-z\u00a1-\uffff]{2,}))
    )
    # port number
    (?::\d{2,5})?
    # resource path
    (?:/[^\s]*)?
    \z
  }xi
	# Relations
	has_many :reports
	has_many :ratings
	belongs_to :user, class_name: "Account", foreign_key: "account_id"
	has_many :comments
	has_many :link_tag_rels
	has_many :tags, through: :link_tag_rels

	# validations
	validates :url, presence: true, format: { with: PERFECT_URL_PATTERN }
	validates :title, presence: true
	validates :level, presence: true,numericality: { greater_than_or_equal_to:1 , less_than_or_equal_to:3}
	validates :description, presence: true, length: { maximum: 100}
	validates_presence_of :user
end
