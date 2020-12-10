# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day09/main'

describe 'Day09' do
  def setup
    @instructions = [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576]
  end

  it 'finds the invalid number' do
    day09 = Day09.new(5, @instructions)
    assert_equal 127, day09.next_invalid
  end

  it 'finds the contiguous set' do
    day09 = Day09.new(5, @instructions)
    cont_set = day09.contiguous_set(day09.next_invalid).sort
    assert_equal 15, cont_set[0]
    assert_equal 47, cont_set[-1]
  end
end
