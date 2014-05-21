require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "task2")

class TestHello < MiniTest::Unit::TestCase
  def test_hello_works
    assert_equal "Hello, Batman", hello('Batman')
    assert_equal "Hello, Robin", hello('Robin')
  end
end

class TestStartsWithVowel < MiniTest::Unit::TestCase
  def test_starts_with_vowel_works
    assert_equal false, starts_with_vowel?('Batman'), 'should handle non-vowel in capital'
    assert_equal false, starts_with_vowel?('batman'), 'should handle non-vowel in lower'
    assert_equal true, starts_with_vowel?('Ivy'), 'should handle vowel in capital'
    assert_equal true, starts_with_vowel?('ivy'), 'should handle vowel in lower'
  end

  def test_starts_with_vowel_works_with_no_letters
    assert_equal false, starts_with_vowel?(''), 'should handle empty string'
    assert_equal false, starts_with_vowel?('123aaa'), 'should handle numbers'
    assert_equal false, starts_with_vowel?('!aaa'), 'should handle arbitrary symbols'
  end
end

class TestBinaryMultipleOf4 < MiniTest::Unit::TestCase
  def test_binary_multiple_of_4_for_empty_string
    assert_equal false, binary_multiple_of_4?('')
  end

  def test_binary_multiple_of_4_for_non_alpha_strings
    assert_equal false, binary_multiple_of_4?('Batman')
  end

  def test_binary_multiple_of_4_for_non_binaries
    assert_equal false, binary_multiple_of_4?('11112')
  end

  def test_binary_multiple_of_4_for_binaries_non_multiple_of_4
    assert_equal false, binary_multiple_of_4?('11111')
  end

  def test_binary_multiple_of_4_for_binaries_non_multiple_of_4
    assert_equal true, binary_multiple_of_4?('10000')
  end
end
