class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions

  has_many :test_results
  has_many :users, through: :test_results

  class << self
    def tests_by_category(category)
      Test
        .joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where('categories.title = ?', category)
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
