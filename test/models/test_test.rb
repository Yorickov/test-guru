require 'test_helper'

class TestTest < ActiveSupport::TestCase
  def setup
    @test = tests(:two)
  end

  test 'tests by category' do
    expected = Test.titles_by_category('english')
    assert_equal %w[syntax punctuation], expected
  end

  test 'categories' do
    test = tests(:one)
    assert_equal 'english', test.category.title
  end

  test 'questions' do
    assert_equal 2, @test.questions.size
  end

  test 'users' do
    test = tests(:three)
    assert_equal 'Sarah', test.author.first_name
  end

  test 'test_results' do
    assert_equal 'Lowson', @test.users.first.last_name
  end

  test 'level' do
    assert_equal 1, Test.simple.count
    assert_equal 2, Test.medium.count
    assert_equal 1, Test.hard.count
  end

  test 'validation title' do
    assert @test.valid?
    @test.title = ''
    assert @test.invalid?
  end

  test 'validation level' do
    assert @test.valid?
    @test.level = -2
    assert @test.invalid?
    @test.level = 2.5
    assert @test.invalid?
  end

  test 'uniquness' do
    test2 = tests(:three)
    test2.title = @test.title
    assert test2.invalid?
  end
end
