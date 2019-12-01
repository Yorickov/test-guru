require 'test_helper'

class TestPassageTest < ActiveSupport::TestCase
  test 'tests' do
    test_result = test_passages(:one)
    assert_equal 'John', test_passage.user.first_name
    assert_equal 'syntax', test_passage.test.title
  end
end
