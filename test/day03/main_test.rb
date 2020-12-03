# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day03/main'

map_lines = [
  '..##.......'.split(''),
  '#...#...#..'.split(''),
  '.#....#..#.'.split(''),
  '..#.#...#.#'.split(''),
  '.#...##..#.'.split(''),
  '..#.##.....'.split(''),
  '.#.#.#....#'.split(''),
  '.#........#'.split(''),
  '#.##...#...'.split(''),
  '#...##....#'.split(''),
  '.#..#...#.#'.split('')
]
map = Map.new(map_lines)

describe 'Map' do
  describe '#tree?' do
    it 'finds a tree correctly' do
      assert map.tree?(2, 0)
      assert map.tree?(3, 0)
      refute map.tree?(1, 1)
    end
  end
  describe '#path_tree_count' do
    it 'finds the correct number of trees' do
      map = Map.new(map_lines)
      assert_equal map.path_tree_count([3, 1]), 7
    end
  end
end
