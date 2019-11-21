class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :test_results
  has_many :users, through: :test_results

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }

  scope :by_category, ->(category) {
    Test
      .unscoped # Rails 6.1: no inherit scoping
      .joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  scope :simple, -> { where(level: [0, 1]) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  class << self
    def tests_by_category(category)
      by_category(category).pluck(:title)
    end
  end
end
