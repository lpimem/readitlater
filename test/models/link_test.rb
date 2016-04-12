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
#


require 'test_helper'

class LinkTest < ActiveSupport::TestCase
 
 #title tests 
   test "Link with a valid Title should be valid" do
     test1 =links(:test1)
     assert test1.valid?
  end

  test "Link with empty Title should be invalid" do
     test1 =links(:test1)
     test1.title= ''
     assert test1.invalid?
  end

#URL tests
  test "Link with a valid url should be valid" do
     test1 =links(:test1)
     assert test1.valid?
  end

  test "Link with empty URL should be invalid" do
     test1 =links(:test1)
     test1.url= ''
     assert test1.invalid?
  end

  test "Link with non-unique URL should be invalid" do
     test2=links(:test2)
     test2.url="http://google.com"
     assert test2.invalid?
  end

   test "Link should be invalid if has invalid url" do
    test1 = links(:test1)
    test1.url = 'hwy.com'
    assert test1.invalid?
  end

#Description tests
  test "Link with a valid Description should be valid" do
     test1 =links(:test1)
     assert test1.valid?
  end
  
  test "Link with empty Description should be invalid" do
     test1 =links(:test1)
     test1.description= ''
     assert test1.invalid?
  end

  test "Link with Description of length greater than 100 characters should be invalid" do
     test1=links(:test1)
     test1.description= "soumyaS ADDJJJJJJJFW RWRG;EGTJGFAAJDEEEEEEEEEEEE scfndskgflreghregterteyt  vtgreteit EEEEEEEEE    GAJKGFAGGHDAFBNFDBGJKADGUIFwjkejwkewr eweee mfwebFKJEWFEWUKFwk lkr wfjr hfrgrkgrgre htrjgfjh jeeeeeeeeeeeeeee"
     assert test1.invalid?
  end


#level tests
  test "Link with a valid Level should be valid" do
     test1 =links(:test1)
     assert test1.valid?
  end
  
  test "Link with empty level should be invalid" do
     test1 =links(:test1)
     test1.level= ''
     assert test1.invalid?
  end

  test "Link with level less than 1 is invalid" do
    test1=links(:test1)
    test1.level= 0
    assert test1.invalid?
  end

  test "Link with level greater than 3 is invalid" do
     test1=links(:test1)
     test1.level= 8
     assert test1.invalid?
  end
end
