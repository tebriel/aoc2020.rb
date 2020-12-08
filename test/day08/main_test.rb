# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day08/main'

describe 'Day08' do
  def setup
    @instructions = [
      'nop +0',
      'acc +1',
      'jmp +4',
      'acc +3',
      'jmp -3',
      'acc -99',
      'acc +1',
      'jmp -4',
      'acc +6'
    ]
  end

  it 'runs the test program' do
    day08 = Day08.new(@instructions)
    day08.run
    assert_equal 5, day08.accumulator
  end

  it 'finds the wrong op' do
    day08 = find_wrong_op(@instructions)
    assert_equal 8, day08.accumulator
  end
end
