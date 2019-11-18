class Test < ApplicationRecord
  belongs_to :category

  class << self
    def tests_by_category(category)
      Test
        .joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where('categories.title = ?', category)
        .pluck(:title)
        .sort { |a, b| b <=> a }
    end
  end
end
