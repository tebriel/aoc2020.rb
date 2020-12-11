# frozen_string_literal: true

require 'set'

# Find chain of adapters for joltages
class Day10
  attr_reader :chain, :max_value, :differences, :distances

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
    @distances = []
    @adapters.sort.each do |adapter|
      diff = [adapter - last, 0].max
      puts "Not good #{last}, #{adapter}, #{diff}" if diff > 3
      @distances.append(diff)
      @differences[diff].append(last = adapter)
      @chain.append(adapter)
    end

    @differences[3].append(@max_value = last + 3)
  end

  def shortest_chain
    chain_adapters
    short_chain = @chain.dup
    last_valid = 0
    next_valid = 3
    @chain.each_with_index do |item, idx|
      next if idx == @chain.length - 1

      if @chain[idx + 1] <= next_valid
        short_chain[idx] = 'X'
      else
        next_valid = item + 3
        last_valid = item
      end
    end
    short_chain.delete('X')
    short_chain
  end

  def possible_variations
    variations = 0
    shortest = shortest_chain
    difference = @chain.length - shortest.length
    (1..difference).each do |choose|
      vars = ((1..difference).inject(1, :*)/((1..choose).inject(1, :*)*(1..difference-choose).inject(1, :*)))
      puts("#{difference}, #{choose}, #{vars}")
      variations += vars
    end
    variations
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
