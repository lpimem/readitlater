# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  
  validates :username, presence: true,
      uniqueness: true, format: {
        with: /\w[\w\d_]*/,
        message: "username must start with a letter, and can only contains letters, digits and underscores"
      }

  validates :password, presence: true

  validates :level, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 2
  }

has_many :rate, class_name: "rating", foreign_key: "rate"
has_many :followship, class_name: "followship", foreign_key: "followship_id"
belong_to :follower, class_name: "followship", foreign_key: "followship_id"

end
