require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "task3")

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
    assert_equal "6-65111-662-2", @book.isbn
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

