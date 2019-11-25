require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @test = tests(:one)
  end

  test 'should get index' do
    get test_questions_url(@test)
    assert_response :success
    assert_select 'h1', "Questions in #{@test.title}"
  end

  test 'should get new' do
    get new_test_question_url(@test)
    assert_response :success
    assert_select 'h1', 'Create new question'
  end

  # test "should get edit" do
  #   get questions_edit_url
  #   assert_response :success
  # end

  test 'should get show' do
    question = questions(:one)
    get question_url(question)
    assert_response :success
    assert_select 'h1', 'Question'
  end

  test 'should create' do
    post "/tests/#{@test.id}/questions", # TODO: :id in params
         params: { question: { body: 'success' } }
    assert_response :redirect
    follow_redirect!
    assert_select 'li', 'success'
  end

  test 'fail create' do
    post "/tests/#{@test.id}/questions",
         params: { question: { body: '' } }
    assert_response :success
    assert_select 'h1', 'Create new question'
  end

  test 'should destroyed' do
    question = questions(:four)
    delete "/questions/#{question.id}"
    assert_equal 3, Question.all.length
  end
end
