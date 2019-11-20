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

  test 'validation first_name' do
    assert(@user.valid?)
    @user.first_name = ''
    refute(@user.valid?)
  end

  test 'validation last_name' do
    assert(@user.valid?)
    @user.last_name = ''
    refute(@user.valid?)
  end

  test 'validation email' do
    assert(@user.valid?)
    @user.email = ''
    refute(@user.valid?)
  end
end
