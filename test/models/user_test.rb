require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'tests_by_level' do
    expected = User.find_by(first_name: 'John').tests_by_level(1).first
    assert_equal(1, expected.level)
  end

  test 'own_tests' do
    assert_equal(2, @user.own_tests.size)
  end

  test 'test_results' do
    assert_equal('syntax', @user.tests.first.title)
  end
end
