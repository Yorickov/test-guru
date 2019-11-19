require 'test_helper'

class TestTest < ActiveSupport::TestCase
  test 'tests_by_category' do
    expected = Test.tests_by_category('english')
    assert_equal(%w[syntax punctuation], expected)
  end
end
