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
#


class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :followships, class_name: "followship", foreign_key: "followship_id"
  has_many :followers, through: :followships, class_name: "account", foreign_key: "follower_id"
  has_many :followingships, class_name: "followship", foreign_key: "followingship_id"
  has_many :followings, through: :followships, class_name: "account", foreign_key: "following_id"

  has_many :links


#self-joins
# has_many :followers, class_name: "account", foreign_key: "followship"
# belongs_to :following, class_name: "account", foreign_key: "follower" 
end
