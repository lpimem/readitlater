# == Schema Information
#
# Table name: followships
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  following_id :reference
#  follower_id  :reference
#


require 'test_helper'

class FollowshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
