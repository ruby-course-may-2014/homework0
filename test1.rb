require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "task1")

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
    assert_equal 80, max_2_sum([50, 10, 20, 30])
  end
end

class TestSumToN < MiniTest::Unit::TestCase
  def test_empty_array_only_sums_to_zero
    assert_equal true, sum_to_n?([], 0), "Empty array should sum to zero"
    assert_equal false, sum_to_n?([], 10), "Empty array should not sum to non-zero"
  end

  def test_one_element_array_only_sums_to_it
    assert_equal true, sum_to_n?([10], 10), "One element array should sum to that element"
    assert_equal false, sum_to_n?([10], 20), "One element array should not sum to other than its element"
  end

  def test_sum_to_n_general_case
    assert_equal true, sum_to_n?([50, -5, 10, 20, 30], 40), "General sum should work"
    assert_equal true, sum_to_n?([50, -5, 10, 20, 30], 25), "Negative numbers should work"
    assert_equal true, sum_to_n?([50, -15, 10, 20, 30], -5), "Negative target numbers should work"
    assert_equal false, sum_to_n?([50, -5, 10, 20, 30], 100), "One number should only be counted once"
    assert_equal false, sum_to_n?([100, 150, 2, 3, 4], 10), "Thou should not cheat"
  end
end

