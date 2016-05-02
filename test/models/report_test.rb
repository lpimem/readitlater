# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  account_id :integer
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @test1 = reports(:test1)
  end

     #reason presence
     test "Report with a reason should be valid" do
	     assert @test1.valid?
     end

     test "Report with empty reason should be invalid" do
	     @test1.reason= ''
	     assert @test1.invalid?
     end

    #reason format testing
    test "Link should be invalid if has invalid url" do
	    @test1.reason = '#*()+++=='
	    assert @test1.invalid?
	end



end
