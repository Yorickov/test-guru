class Badge < ApplicationRecord
  validates :title, :filename, :rule_name, presence: true
  validates :rule_name, uniqueness: true,
                        if: proc { |b| b.rule_param.blank? }
  validates :rule_name, uniqueness: { scope: :rule_param },
                        unless: proc { |b| b.rule_param.blank? }

  has_and_belongs_to_many :users

  class << self
    def rules
      {
        level: proc { |*args| rule_with_param(*args) },
        category: proc { |*args| rule_with_param(*args) },
        all: proc { |*args| all_tests(*args) },
        first: ->(user, _badge, _value) {
          user.tests.where(id: user.tests.last.id).count == 1
        }
      }
    end

    def all_tests(user, badge, _value)
      count = user.test_passages.success
                  .distinct.select(:test_id)
                  .count
      logger.debug "count #{count}"
      count == Test.ready.count && clause_one_badge?(user, badge)
    end

    def rule_with_param(user, badge, opts)
      count = user.test_passages.success
                  .joins(:test)
                  .where(tests: opts)
                  .distinct.select(:test_id)
                  .count

      logger.debug "count #{count}"
      count == Test.ready.where(opts).count && clause_one_badge?(user, badge)
    end

    def clause_one_badge?(user, badge)
      user.badges.where(id: badge.id).empty?
    end
  end
end
