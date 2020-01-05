module TestsHelper
  TEST_LEVEL = {
    0 => I18n.t('test_level.elementary'),
    1 => I18n.t('test_level.basic'),
    2 => I18n.t('test_level.intermediate'),
    3 => I18n.t('test_level.advanced'),
    4 => I18n.t('test_level.hero'),
    5 => I18n.t('test_level.impossible')
  }.freeze

  def test_level(test)
    TEST_LEVEL[test.level] || :elementary
  end

  def test_header(test)
    test.persisted? ? t('.header_edit') : t('.header_create')
  end

  def test_timer(test)
    test.time_limit.zero? ? '---' : test.time_limit
  end
end
