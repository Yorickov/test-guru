require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end

  test 'should get show' do
    get user_url(@user)
    assert_response :success
  end
end
