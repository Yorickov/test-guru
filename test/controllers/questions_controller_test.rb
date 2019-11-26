require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test = tests(:one)
    @question = questions(:one)
  end

  test 'should get index' do
    get test_questions_url(@test)
    assert_response :success
    assert_select 'h1', "Questions in #{@test.title}" # to system test
  end

  test 'should get new' do
    get new_test_question_url(@test)
    assert_response :success
    assert_select 'h1', 'Create new question' # to system test
  end

  # test "should get edit" do
  #   get questions_edit_url
  #   assert_response :success
  # end

  test 'should create' do
    assert_difference('Question.count') do
      post test_questions_url(@test),
           params: { question: { body: 'success' } }
    end
  end

  test 'should get show' do
    get question_url(@question)
    assert_response :success
    assert_select 'h1', 'Question' # to system test
  end

  test 'fail create' do
    post test_questions_url(@test),
         params: { question: { body: '' } }
    assert_response :success
    assert_select 'h1', 'Create new question'
  end

  test 'should destroyed' do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end
  end
end
