# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day01/main'

describe '#find_combo' do
  it 'finds 2 that sum to 2020' do
    numbers = [1721, 979, 366, 299, 675, 1456]
    result = find_combo 2020, numbers, 2
    assert_equal result.sort, [299, 1721]
  end

  it 'finds 3 that sum to 2020' do
    numbers = [1721, 979, 366, 299, 675, 1456]
    result = find_combo 2020, numbers, 3
    assert_equal result.sort, [366, 675, 979]
  end
end
