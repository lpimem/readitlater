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
end
