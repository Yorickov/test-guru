class User < ApplicationRecord
  has_secure_password

  has_many :own_tests, class_name: 'Test'

  has_many :test_results
  has_many :tests, through: :test_results

  def tests_by_level(level)
    Test
      .joins('INNER JOIN test_results ON tests.id = test_results.test_id')
      .where('test_results.user_id = ? AND tests.level = ?', id, level)
  end
end
