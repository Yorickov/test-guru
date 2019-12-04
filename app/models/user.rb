class User < ApplicationRecord
  has_secure_password

  has_many :own_tests, class_name: 'Test', inverse_of: 'author'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :first_name, :last_name, :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
