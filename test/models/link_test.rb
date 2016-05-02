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

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @link = links(:test1)
  end

 #title tests
   test "Link with a valid Title should be valid" do
     assert @link.valid?
  end

  test "Link with empty Title should be invalid" do
     @link.title= ''
     assert @link.invalid?
  end

#URL tests
  test "Link with a valid url should be valid" do
     assert @link.valid?
  end

  test "Link with empty URL should be invalid" do
     @link.url= ''
     assert @link.invalid?
  end


   test "Link should be invalid if has invalid url" do
    @link.url = 'hwy.com'
    assert @link.invalid?
  end

#Description tests
  test "Link with a valid Description should be valid" do
     assert @link.valid?
  end

  test "Link with empty Description should be invalid" do
     @link.description= ''
     assert @link.invalid?
  end

  test "Link with Description of length greater than 100 characters should be invalid" do
     @link.description= "soumyaS ADDJJJJJJJFW RWRG;EGTJGFAAJDEEEEEEEEEEEE scfndskgflreghregterteyt  vtgreteit EEEEEEEEE    GAJKGFAGGHDAFBNFDBGJKADGUIFwjkejwkewr eweee mfwebFKJEWFEWUKFwk lkr wfjr hfrgrkgrgre htrjgfjh jeeeeeeeeeeeeeee"
     assert @link.invalid?
  end


#level tests
  test "Link with a valid Level should be valid" do
     assert @link.valid?
  end

  test "Link with empty level should be invalid" do
     @link.level= ''
     assert @link.invalid?
  end

  test "Link with level less than 1 is invalid" do
    @link.level= 0
    assert @link.invalid?
  end

  test "Link with level greater than 3 is invalid" do
     @link.level= 4
     assert @link.invalid?
  end

  test "level should be present" do
    @link.level = nil
    assert @link.invalid?
  end

end
