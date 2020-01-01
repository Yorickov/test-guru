class TestPassage < ApplicationRecord
  CHECK_PASSED = 85
  TEST_TIME_RATE = 100

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_test_time, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids, timer)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.test_time = timer
    save!
  end

  def result
    (correct_questions.to_f / test.questions.size * 100).to_i
  end

  def passed?
    result >= CHECK_PASSED
  end

  def progress
    questions = test.questions
    result = questions.find_index(current_question).to_f / questions.count * 100
    result.to_i
  end

  def timer_step
    (10 * test.time_limit).round(1)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where(
      'id > ?', current_question.id
    ).first
  end

  def before_validation_set_test_time
    self.test_time = TEST_TIME_RATE
  end
end
