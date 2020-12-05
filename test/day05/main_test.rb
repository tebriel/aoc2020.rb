# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day05/main'

describe '#find_position' do
  it 'does the front/back example' do
    pos = find_position('FBFBBFF', 128)
    assert_equal 44, pos
  end

  it 'does the right/left example' do
    pos = find_position('RLR', 8)
    assert_equal 5, pos
  end
end

describe '#read_pass' do
  it 'does some examples' do
    assert_equal [70, 7, 567], read_pass('BFFFBBFRRR')
    assert_equal [14, 7, 119], read_pass('FFFBBBFRRR')
    assert_equal [102, 4, 820], read_pass('BBFFBBFRLL')
  end
end
