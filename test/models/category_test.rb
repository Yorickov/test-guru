require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'tests' do
    category = categories(:one)
    assert_equal(2, category.tests.size)
  end
end
