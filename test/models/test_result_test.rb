require 'test_helper'

class TestResultTest < ActiveSupport::TestCase
  test 'tests' do
    test_result = test_results(:one)
    assert_equal('John', test_result.user.first_name)
    assert_equal('syntax', test_result.test.title)
  end
end
