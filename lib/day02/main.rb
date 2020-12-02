#!/usr/bin/env ruby
# frozen_string_literal: true

# Manage a password object using the input file syntax
class Password
  LINE_PATTERN = /(?<min_count>\d+)-(?<max_count>\d+) (?<match_letter>[a-z]): (?<password>[a-z]+)$/.freeze

  attr_reader :min_count, :max_count, :match_letter, :password

  def initialize(line)
    parse_line line
  end

  def parse_line(line)
    data = LINE_PATTERN.match(line)
    @min_count = data[:min_count].to_i
    @max_count = data[:max_count].to_i
    @match_letter = data[:match_letter]
    @password = data[:password]
    @match_count = @password.count @match_letter
  end

  def valid?
    false
  end
end

# Adds the validity rules for Part01
class Part1 < Password
  def valid?
    ((@min_count <= @match_count) and (@match_count <= @max_count))
  end
end

# Adds the validity rules for Part02
class Part2 < Password
  def valid?
    first = @password[@min_count - 1]
    second = @password[@max_count - 1]
    first != second and [first, second].include?(@match_letter)
  end
end

if $PROGRAM_NAME == __FILE__
  valid = 0
  File.foreach('inputs/day02.txt') do |line|
    valid += 1 if Part1.new(line).valid?
  end
  puts "Part1: I found #{valid} valid passwords."

  valid = 0
  File.foreach('inputs/day02.txt') do |line|
    valid += 1 if Part2.new(line).valid?
  end
  puts "Part2: I found #{valid} valid passwords."
end
