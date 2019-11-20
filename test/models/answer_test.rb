require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @answer = answers(:one)
  end

  test 'questions' do
    assert_equal('Question1', @answer.question.body)
  end

  test 'correct' do
    assert_equal(2, Answer.correct.count)
  end

  test 'validation' do
    assert(@answer.valid?)
    @answer.body = ''
    assert(@answer.invalid?)
  end
end
