module TestsHelper
  TEST_LEVEL = {
    0 => :elementary,
    1 => :basic,
    2 => :intermediate,
    3 => :advanced,
    4 => :hero,
    5 => :impossible
  }.freeze

  def test_level(test)
    TEST_LEVEL[test.level] || :elementary
  end

  def test_header(test)
    test.persisted? ? t('.header_edit') : t('.header_create')
  end
end
