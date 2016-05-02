# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  MAX_TAG_LENGTH = 36
  setup do
      @ruby = tags(:one)
  end

  test "valid tags" do
    assert @ruby.valid?

    for l in ["1", "a1" * (MAX_TAG_LENGTH / 2), "a_1", "1_a"]
      @ruby.label = l
      assert @ruby.valid?
    end
  end

  test "tag label should be longer than 0" do
    @ruby.label = ""
    assert @ruby.invalid?
  end

  test "tag label should be less than 37" do
    @ruby.label = "a" * 37
    assert @ruby.invalid?
  end

  test "tags with invalid chars" do
    for l in [".", ",", " ", ";", "+", "-", "*", "/", "\t", "\r", "\n", ""]
      @ruby .label = l
      assert @ruby.invalid?
    end
  end

  test "tags should have label" do
    @ruby.label = nil
    assert @ruby.invalid?
  end

  test "duplicated tags" do
    assert_raises(Exception){
      Tag.create!(label=@ruby.label)
    }
  end

  test "duplicated tags ignore cases" do
    assert_raises(Exception){
      Tag.create!(label=@ruby.label.upcase)
    }
  end


end
