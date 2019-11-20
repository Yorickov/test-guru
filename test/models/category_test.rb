require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'tests' do
    category = categories(:one)
    assert_equal(2, category.tests.size)
  end

  test 'default scope' do
    expected = %w[biology english math]
    assert_equal(expected, Category.all.pluck(:title))
    assert_not_equal(expected, Category.unscoped.all.pluck(:title))
  end
end
