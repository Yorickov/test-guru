class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  default_scope { order(:title) }

  def to_s
    title.to_s
  end
end
