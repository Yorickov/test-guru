require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'tests_by_level' do
    expected = User.find_by(first_name: 'John').tests_by_level(1).first
    assert_equal(1, expected.level)
  end
end
