class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :own_tests, class_name: 'Test', inverse_of: 'author'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

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
