# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :integer
#  account_id :integer
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "the comment should be valid."do
    # self.use_instantiated_fixtures = true
    comment = comments(:one)
    assert comment.valid?
  end

  test "the comment is unvalid if it is blank."do
    # self.use_instantiated_fixtures = true
    comment = comments(:one)
    comment.comment = ""
    assert comment.invalid?
  end

end
