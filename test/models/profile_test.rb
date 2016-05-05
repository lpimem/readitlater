# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "all valid test" do
   		prog1 = Profile.new
   		prog1.first_name = "kamrun"
   		prog1.last_name = "Naher"
  		assert prog1.valid?
    end
  test " valid test for last_name" do
   		prog1 = Profile.new
   		prog1.first_name = "Lei"
  		assert prog1.valid?
    end

   	test " invalid test for first_name" do
   		prog1 = Profile.new
   		prog1.last_name = "pai"
  		assert prog1.invalid?
end
