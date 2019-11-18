class User < ApplicationRecord
  has_secure_password

  def tests_by_level(level)
    Test
      .joins('INNER JOIN test_results ON tests.id = test_results.test_id')
      .where('test_results.user_id = ? AND tests.level = ?', self.id, level)
      .select(:title)
  end
end
