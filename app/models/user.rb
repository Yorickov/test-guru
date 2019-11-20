class User < ApplicationRecord
  has_secure_password

  has_many :own_tests, class_name: 'Test'

  has_many :test_results
  has_many :tests, through: :test_results

  def tests_by_level(level)
    Test
      .joins(:test_results)
      .where(test_results: { user_id: id })
      .where(level: level)
  end
end
