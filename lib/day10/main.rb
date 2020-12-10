# frozen_string_literal: true

require 'set'

# Find invalid XMAS cipher numbers and contiguous sets
class Day10
  attr_reader :chain, :max_value, :differences

  def initialize(adapters)
    @adapters = adapters
    @chain = []
    @max_value = 0
    @differences = {}
  end

  def chain_adapters
    last = 0
    @chain = []
    @differences = {
      1 => [],
      2 => [],
      3 => []
    }
    @adapters.sort.each do |adapter|
      diff = [adapter - last, 0].max
      puts "Not good #{last}, #{adapter}, #{diff}" if diff > 3
      @differences[diff].append(last = adapter)
      @chain.append(adapter)
    end

    @differences[3].append(@max_value = last + 3)
  end
end

if $PROGRAM_NAME == __FILE__
  adapters = []
  File.foreach('inputs/day10.txt') do |line|
    adapters.append(line.chomp.to_i)
  end
  day10 = Day10.new(adapters)

  day10.chain_adapters
  ones = day10.differences[1].count
  threes = day10.differences[3].count
  puts("#{ones} * #{threes} == #{ones * threes}")
end
