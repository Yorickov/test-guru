class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_count

  scope :correct, -> { where(correct: true) }

  after_create :after_create_check_state
  after_destroy :after_destroy_check_state

  private

  def validate_max_count
    errors.add(:question, 'no more 4 answers') if question.answers.length > 4
  end

  def after_create_check_state
    answers = question.answers

    question.add! if answers.size == 1
    question.complete! if answers.size == 4
  end

  def after_destroy_check_state
    answers = question.answers

    question.remove! if answers.empty?
    question.revert! if answers.size == 3
  end
end
