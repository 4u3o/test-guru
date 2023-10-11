module TestsHelper
  TEST_LEVELS = {
    0 => I18n.t('.easy'),
    1 => I18n.t('.elementary'),
    2 => I18n.t('.advanced'),
    3 => I18n.t('.hard')
  }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('.hero')
  end
end
