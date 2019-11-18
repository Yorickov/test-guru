class User < ApplicationRecord
  has_secure_password

  def tests_by_level(level); end
end
