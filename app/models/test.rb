class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions

  has_many :test_results
  has_many :users, through: :test_results

  validates :title, presence: true
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0
  }
  validates_uniqueness_of :title, scope: :level

  scope :by_category, ->(category) {
    Test
      .unscoped # Rails 6.1: no inherit scoping
      .joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title) # TODO: fluent interface?
  }

  scope :simple, -> { where(level: [0, 1]) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
end
