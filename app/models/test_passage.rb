class TestPassage < ApplicationRecord
  include AASM

  CHECK_PASSED = 85
  TEST_TIME_RATE = 100

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_test_time, on: :create
  before_update :before_update_set_next_question

  aasm column: 'state' do
    state :active, initial: true
    state :expired, :failed, :success

    event :time_off do
      transitions from: :active, to: :expired
    end

    event :lose do
      transitions from: :active, to: :failed
    end

    event :win do
      transitions from: :active, to: :success
    end
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids, timer)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.test_time = timer

    questions = test.questions.order(:id)
    curr_question_index = questions.find_index(current_question)

    if curr_question_index == questions.size - 1
      passed? ? win : lose
    end

    save!
  end

  def result
    (correct_questions.to_f / test.questions.size * 100).to_i
  end

  def passed?
    result >= CHECK_PASSED
  end

  def progress
    questions = test.questions.order(:id)
    result = questions.find_index(current_question).to_f / questions.count * 100
    result.to_i
  end

  def timer_step
    10 * test.time_limit
  end

  def timer_time
    test.time_limit - (test_time.to_f / 100 * test.time_limit).to_i
  end

  def handle_badges
    Badge.all.each do |b|
      rule_name = b.rule_name.to_sym
      rule = Badge.rules[rule_name]

      opts = b.rule_param ? { rule_name => b.rule_param } : ''

      check = rule.call(user, b, opts)
      if check
        logger.debug 'true'
        user.badges << b
      else
        logger.debug 'false'
      end
    end
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
