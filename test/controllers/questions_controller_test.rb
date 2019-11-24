require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test = tests(:one)
  end
  test 'should get index' do
    get test_questions_url(@test)
    assert_response :success
  end

  # test "should get new" do
  #   get questions_new_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get questions_edit_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get questions_show_url
  #   assert_response :success
  # end
end
