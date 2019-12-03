require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:three)
    @answer = answers(:five)
  end

  test 'should get new' do
    get new_question_answer_url(@question)
    assert_response :success
  end

  test 'should create answer' do
    assert_difference('Answer.count') do
      post question_answers_url(@question),
           params: { answer: { body: @answer.body, correct: @answer.correct } }
    end

    assert_redirected_to answer_url(Answer.last)
  end

  test 'should show answer' do
    get answer_url(@answer)
    assert_response :success
  end

  test 'should get edit' do
    get edit_answer_url(@answer)
    assert_response :success
  end

  test 'should destroy answer' do
    assert_difference('Answer.count', -1) do
      delete answer_url(@answer)
    end
    assert_redirected_to question_url(@answer.question)
  end
end
