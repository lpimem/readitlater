# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  value      :integer          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  account_id :integer
#



require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
