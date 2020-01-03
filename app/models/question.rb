class Question < ApplicationRecord
  include AASM

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true

  after_create :after_create_check_state
  after_destroy :after_destroy_check_state

  aasm column: 'state' do
    state :draft, initial: true
    state :working
    state :ready

    event :add do
      transitions from: :draft, to: :working, after: :add_test
    end

    event :remove do
      transitions from: :working, to: :draft, after: :remove_test
    end

    event :complete do
      transitions from: :working, to: :ready
    end

    event :revert do
      transitions from: :ready, to: :working
    end
  end

  private

  def after_create_check_state
    test.remove! if test.working?
  end

  def add_test
    test.add! if test.questions.draft.size == 1
  end

  def remove_test
    test.remove! if test.working?
  end

  def after_destroy_check_state
    test.add! if draft? && test.questions.draft.empty?
    test.remove! if working? && test.questions.empty?
  end
end
