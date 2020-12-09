# frozen_string_literal: true

require 'set'

# Find invalid XMAS cipher numbers and contiguous sets
class Day09
  def initialize(preamble_length, numbers)
    @preamble_length = preamble_length
    @numbers = numbers
  end

  def next_invalid
    cur_idx = 0
    while cur_idx < @numbers.count - @preamble_length
      sums = Set.new
      # puts @numbers[cur_idx..(cur_idx + @preamble_length - 1)].to_s
      @numbers[cur_idx..(cur_idx + @preamble_length - 1)].combination(2).each { |elem| sums.add(elem.sum) }
      num = @numbers[cur_idx + @preamble_length]
      return num unless sums.include? num

      cur_idx += 1
    end
  end

  def contiguous_set(desired_sum)
    set_size = 2
    while set_size < @numbers.count
      @numbers.each_with_index do |_num, idx|
        next unless idx < (@numbers.count - 1)

        group = @numbers[idx..(idx + set_size)]
        return group if group.sum == desired_sum
      end
      set_size += 1
    end
  end
end

if $PROGRAM_NAME == __FILE__
  instructions = []
  File.foreach('inputs/day09.txt') do |line|
    instructions.append(line.chomp.to_i)
  end
  day09 = Day09.new(25, instructions)
  puts(day09.next_invalid)
  cont_set = day09.contiguous_set(day09.next_invalid).sort
  puts(cont_set.to_s, cont_set.sum)
  puts(cont_set[0] + cont_set[-1])
end
