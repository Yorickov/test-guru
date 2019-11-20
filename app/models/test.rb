class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions

  has_many :test_results
  has_many :users, through: :test_results

  scope :by_category, ->(category) {
    Test
      .unscoped # Rails 6.1: no inherit scoping
      .joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', category)
      .order(title: :desc)
      .pluck(:title)
  }

  scope :simple, -> { where(level: [0, 1]) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
end
