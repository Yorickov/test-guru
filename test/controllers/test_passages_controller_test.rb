require 'test_helper'

class TestPassagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get test_passages_show_url
    assert_response :success
  end

  test "should get result" do
    get test_passages_result_url
    assert_response :success
  end

  test "should get update" do
    get test_passages_update_url
    assert_response :success
  end

end
