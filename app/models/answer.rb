class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_count
    errors.add(:question) if question.answers.length >= 4
  end
end
