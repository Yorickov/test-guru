class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
  end

  def call
    Badge.all.each do |b|
      rule_name = b.rule_name.to_sym
      rule_param = b.rule_param || ''

      rule = rules[rule_name]
      opts = { rule_name => rule_param }

      check = rule.call(@user, b, opts)
      @user.badges << b if check
    end
  end

  private

  def rules
    {
      level: proc { |*args| rule_with_param(*args) },
      category: proc { |*args| rule_with_param(*args) },
      all: proc { |*args| all_tests(*args) },
      first: ->(user, _badge, _opts) {
        user.test_passages
            .where(test_id: user.test_passages.last.test_id).count == 1
      }
    }
  end

  def all_tests(user, badge, _opts)
    count = user.test_passages.success
                .distinct.select(:test_id)
                .count

    count == Test.ready.count && clause_one_badge?(user, badge)
  end

  def rule_with_param(user, badge, opts)
    count = user.test_passages.success
                .joins(:test)
                .where(tests: opts)
                .distinct.select(:test_id)
                .count

    count == Test.ready.where(opts).count && clause_one_badge?(user, badge)
  end

  def clause_one_badge?(user, badge)
    user.badges.where(id: badge.id).empty?
  end
end
