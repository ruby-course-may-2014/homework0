require 'minitest/autorun'
(1..3).each { |n| require File.join(File.dirname(__FILE__), "task#{n}") }

class TestSum < MiniTest::Unit::TestCase
  def test_empty_array_sums_to_zero
    assert_equal 0, sum([])
  end

  def test_one_element_array_sums_to_it
    assert_equal 10, sum([10])
  end

  def test_sum_general_case
    assert_equal 60, sum([10, 20, 30])
  end
end

class TestMax2Sum < MiniTest::Unit::TestCase
  def test_empty_array_results_in_zero
    assert_equal 0, max_2_sum([])
  end

  def test_one_element_array_results_in_element
    assert_equal 10, max_2_sum([10])
  end

  def test_max_2_sum_general_case
    assert_equal 80, sum([50, 10, 20, 30])
  end
end

class TestSumToN < MiniTest::Unit::TestCase
  def test_empty_array_only_sums_to_zero
    assert_equal true, sum_to_n?([], 0)
    assert_equal false, sum_to_n?([], 10)
  end

  def test_one_element_array_only_sums_to_it
    assert_equal true, sum_to_n?([10], 10)
    assert_equal false, sum_to_n?([10], 20)
  end

  def test_sum_to_n_general_case
    assert_equal true, sum_to_n?([50, -5, 10, 20, 30], 40)
    assert_equal true, sum_to_n?([50, -5, 10, 20, 30], 25)
    assert_equal false, sum_to_n?([50, -5, 10, 20, 30], 100)
  end
end

class TestHello < MiniTest::Unit::TestCase
  def test_hello_works
    assert_equal "Hello, Batman", hello('Batman')
    assert_equal "Hello, Robin", hello('Robin')
  end
end

class TestStartsWithVowel < MiniTest::Unit::TestCase
  def test_starts_with_vowel_works
    assert_equal false, starts_with_vowel?('Batman')
    assert_equal false, starts_with_vowel?('batman')
    assert_equal true, starts_with_vowel?('Ivy')
    assert_equal true, starts_with_vowel?('ivy')
  end

  def test_starts_with_vowel_works_with_no_letters
    assert_equal false, starts_with_vowel?('')
    assert_equal false, starts_with_vowel?('123aaa')
    assert_equal false, starts_with_vowel?('!aaa')
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

class TestBookInStockConstructors < MiniTest::Unit::TestCase
  def test_valid_args
    book = BookInStock.new("2-266-11156-6", 149.95)
    assert_equal "2-266-11156-6", book.isbn
    assert_in_delta 149.95, book.price
  end

  def test_invalid_isbn
    assert_raises(ArgumentError) { BookInStock.new(nil, 149.95) }
    assert_raises(ArgumentError) { BookInStock.new('', 149.95) }
  end

  def test_invalid_price
    assert_raises(ArgumentError) { BookInStock.new("2-266-11156-6", nil) }
    assert_raises(ArgumentError) { BookInStock.new("2-266-11156-6", 0.0) }
    assert_raises(ArgumentError) { BookInStock.new("2-266-11156-6", -149.95) }
  end
end

class TestBookInStockSetters < MiniTest::Unit::TestCase
  def setup
    @book = BookInStock.new("2-266-11156-6", 149.95)
  end

  def test_isbn_setter
    @book.isbn = "6-65111-662-2"
    assert_in_delta "6-65111-662-2", @book.isbn
  end

  def test_price_setter
    @book.price = 200.0
    assert_in_delta 200.0, @book.price
  end
end

class TestPriceAsString < MiniTest::Unit::TestCase
  def test_with_integer
    @book = BookInStock.new("2-266-11156-6", 149.0)
    assert_equal "$149.00", @book.price_as_string
  end

  def test_with_one_digit
    @book = BookInStock.new("2-266-11156-6", 149.9)
    assert_equal "$149.90", @book.price_as_string
  end

  def test_with_two_digits
    @book = BookInStock.new("2-266-11156-6", 149.95)
    assert_equal "$149.95", @book.price_as_string
  end

  def test_with_more_digits_floor
    @book = BookInStock.new("2-266-11156-6", 149.953535)
    assert_equal "$149.95", @book.price_as_string
  end

  def test_with_more_digits_ceil
    @book = BookInStock.new("2-266-11156-6", 149.959595)
    assert_equal "$149.96", @book.price_as_string
  end
end
