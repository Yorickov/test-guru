require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
  end

  test 'tests' do
    assert_equal(2, @category.tests.size)
  end

  test 'default scope' do
    expected = %w[biology english math]
    assert_equal(expected, Category.all.pluck(:title))
    assert_not_equal(expected, Category.unscoped.all.pluck(:title))
  end

  test 'validation' do
    assert(@category.valid?)
    @category.title = ''
    refute(@category.valid?)
  end
end
