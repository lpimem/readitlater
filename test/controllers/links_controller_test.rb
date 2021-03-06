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

class LinksControllerTest < ActionController::TestCase
  setup do
    @link = links(:one)
    @user = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link" do
    sign_in @user
    assert_difference('Link.count') do
      post :create, link: { description: @link.description, level: @link.level, title: @link.title, url: @link.url + "?" + rand(10000).to_s}
    end
    assert_redirected_to authenticated_root_path
    sign_out @user
  end

  test "should show link" do
    sign_in @user
    get :show, id: @link
    assert_response :success
    sign_out @user
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @link
    assert_response :success
    sign_out @user
  end

  test "should update link" do
    sign_in @user
    patch :update, id: @link, link: { description: @link.description, level: @link.level, title: @link.title, url: @link.url }
    assert_redirected_to link_path(assigns(:link))
    sign_out @user
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      sign_in @user
      delete :destroy, id: @link
      sign_out @user
    end
    assert_redirected_to links_path
  end
end
