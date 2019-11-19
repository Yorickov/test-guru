require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test 'tests' do
    question = questions(:one)
    assert_equal('syntax', question.test.title)
  end

  test 'answers' do
    question = questions(:two)
    assert_equal(1, question.answers.size)
  end
end
