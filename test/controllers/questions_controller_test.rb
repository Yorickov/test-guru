require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test = tests(:one)
    @question = questions(:one)
  end

  test 'should get new' do
    get new_test_question_url(@test)
    assert_response :success
  end

  test 'should create' do
    assert_difference('Question.count') do
      post test_questions_url(@test),
           params: { question: { body: 'success' } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test 'should get show' do
    get question_url(@question)
    assert_response :success
  end

  test 'should get edit' do
    get edit_question_url(@question)
    assert_response :success
  end

  test 'fail create' do
    post test_questions_url(@test),
         params: { question: { body: '' } }
    assert_response :success
  end

  test 'should destroyed' do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to test_url(@question.test)
  end
end
