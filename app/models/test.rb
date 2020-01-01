class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: {
    scope: :level,
    message: 'has already such combination title - level'
  }
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0,
    message: 'should be positive integer or nil'
  }

  scope :by_category, ->(category_title) {
    joins(:category).where(categories: { title: category_title })
  }
  scope :simple, -> { where(level: [0, 1]) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  class << self
    def titles_by_category(category)
      by_category(category).order(title: :desc).pluck(:title)
    end
  end

  def timer?
    time_limit != 0
  end
end
