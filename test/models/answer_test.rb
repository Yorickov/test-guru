require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test 'questions' do
    answer = answers(:one)
    assert_equal('Question1', answer.question.body)
  end
end
