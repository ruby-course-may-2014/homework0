require 'minitest/autorun'
(1..3).each { |n| require File.join(File.dirname(__FILE__), "test#{n}") }
