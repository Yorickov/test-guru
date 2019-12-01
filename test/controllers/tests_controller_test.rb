require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test = tests(:one)
  end

  test 'should get index' do
    get tests_url
    assert_response :success
  end

  test 'should get show' do
    get test_url(@test)
    assert_response :success
  end
end
