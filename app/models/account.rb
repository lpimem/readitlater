# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  level                  :integer
#

class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Many to many association between account and followship
  # relations for one's followers
  has_many :followships, foreign_key: "following_id"
  has_many :followers, through: :followships, foreign_key: "following_id"
  # relations for one's followings
  has_many :followingships, class_name: "Followship", foreign_key: "follower_id"
  has_many :followings, through: :followingships, foreign_key: "follower_id", source: "account"

  # One to many association between account and link

  has_many :links

  # One to many association between account and rating

  has_many :ratings


#self-joins
# has_many :followers, class_name: "account", foreign_key: "followship"
# belongs_to :following, class_name: "account", foreign_key: "follower"
end
