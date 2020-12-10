# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day10/main'

describe 'Day10' do
  def setup
    @examples = [
      [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4],
      [28, 33, 18, 42, 31, 14, 46, 20, 48, 47, 24, 23, 49, 45, 19, 38, 39, 11, 1, 32, 25, 35, 8, 17, 7, 9, 4, 2, 34, 10,
       3]
    ]
  end

  it 'does the easy example' do
    day10 = Day10.new(@examples[0])
    day10.chain_adapters
    assert_equal 7, day10.differences[1].count, day10.differences[1].to_s
    assert_equal 5, day10.differences[3].count, day10.differences[3].to_s
  end

  it 'does the hard example' do
    day10 = Day10.new(@examples[1])
    day10.chain_adapters
    assert_equal 22, day10.differences[1].count, day10.differences[1].to_s
    assert_equal 10, day10.differences[3].count, day10.differences[3].to_s
  end
end
