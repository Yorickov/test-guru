require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test = tests(:three)
    @user = users(:one)
    @category = categories(:one)
  end

  test 'should get index' do
    get tests_url
    assert_response :success
  end

  test 'should get show' do
    get test_url(@test)
    assert_response :success
  end

  test 'should create' do
    assert_difference('Test.count') do
      post tests_url(@test), params: { test: {
        title: 'var',
        level: 0,
        user_id: @user.id,
        category_id: @category.id
      } }
    end

    assert_redirected_to test_url(Test.last)
  end

  test 'should get edit' do
    get edit_test_url(@test)
    assert_response :success
  end

  test 'should destroyed' do
    assert_difference('Test.count', -1) do
      delete test_url(@test)
    end

    assert_redirected_to tests_url
  end
end
