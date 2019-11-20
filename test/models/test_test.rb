require 'test_helper'

class TestTest < ActiveSupport::TestCase
  test 'tests by category' do
    expected = Test.by_category('english')
    assert_equal(%w[syntax punctuation], expected)
  end

  test 'categories' do
    test = tests(:one)
    assert_equal('english', test.category.title)
  end

  test 'questions' do
    test = tests(:two)
    assert_equal(2, test.questions.size)
  end

  test 'users' do
    test = tests(:three)
    assert_equal('Sarah', test.author.first_name)
  end

  test 'test_results' do
    test = tests(:two)
    assert_equal('Lowson', test.users.first.last_name)
  end

  test 'level' do
    assert_equal(1, Test.simple.count)
    assert_equal(2, Test.medium.count)
    assert_equal(1, Test.hard.count)
  end
end
