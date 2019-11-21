require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = questions(:one)
  end

  test 'tests' do
    assert_equal('syntax', @question.test.title)
  end

  test 'answers' do
    question = questions(:two)
    assert_equal(1, question.answers.size)
  end

  test 'validation' do
    assert(@question.valid?)
    @question.body = ''
    assert(@question.invalid?)
  end
end
