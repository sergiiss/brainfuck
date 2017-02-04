require 'test_helper'

class TestBrainfuckTranslator < Minitest::Test
  def test_get_two_space
    translator = BrainfuckTranslator.new("++++++++++++++++++++++++++++++++..")
    result = translator.convert_code

    assert_equal "  ", result
  end

  def test_get_two_letter_H
    translator = BrainfuckTranslator.new("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++..")
    result = translator.convert_code

    assert_equal "HH", result
  end
end