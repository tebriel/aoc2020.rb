# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/day02/main'

describe 'Password' do
  describe '#parse_line' do
    it 'parses a password' do
      pass = Password.new('1-3 a: abcde')
      assert_equal pass.min_count, 1
      assert_equal pass.max_count, 3
      assert_equal pass.match_letter, 'a'
      assert_equal pass.password, 'abcde'
    end
  end
end

describe 'Part1' do
  describe '#valid?' do
    it 'checks for validity' do
      input = [
        ['1-3 a: abcde', true],
        ['1-3 b: cdefg', false],
        ['2-9 c: ccccccccc', true]
      ]
      input.each do |line, valid|
        pass = Part1.new(line)
        assert_equal valid, pass.valid?, line
      end
    end
  end
end

describe 'Part2' do
  describe '#valid?' do
    it 'checks for validity' do
      input = [
        ['1-3 a: abcde', true],
        ['1-3 b: cdefg', false],
        ['2-9 c: ccccccccc', false]
      ]
      input.each do |line, valid|
        pass = Part2.new(line)
        assert_equal valid, pass.valid?, line
      end
    end
  end
end
