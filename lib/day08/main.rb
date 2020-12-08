# frozen_string_literal: true

require 'set'

# Run the program from the handheld game console
class Day08
  attr_reader :accumulator, :instruction_pointer

  def initialize(instructions)
    @instructions = instructions
    @accumulator = 0
    @instruction_pointer = 0
    @executed_instructions = Set.new
  end

  def run
    while @instruction_pointer < @instructions.count
      break if @executed_instructions.include?(@instruction_pointer)

      @executed_instructions.add(@instruction_pointer)
      ins, value = @instructions[@instruction_pointer].split
      value = value.to_i
      case ins
      when 'acc'
        @accumulator += value
        @instruction_pointer += 1
      when 'nop'
        @instruction_pointer += 1
      when 'jmp'
        @instruction_pointer += value
      end
    end
  end
end

def find_wrong_op(instructions)
  instructions.each_with_index do |ins, idx|
    next if ins.start_with?('acc')

    new_ins = instructions.dup

    new_ins[idx] = if ins.start_with?('nop')
                     ins.sub(/nop/, 'jmp')
                   else
                     ins.sub(/jmp/, 'nop')
                   end

    day08 = Day08.new(new_ins)
    day08.run
    return day08 if day08.instruction_pointer == new_ins.length
  end
end

if $PROGRAM_NAME == __FILE__
  instructions = []
  File.foreach('inputs/day08.txt') do |line|
    instructions.append(line.chomp)
  end
  day08 = Day08.new(instructions)
  puts(day08.run)
  puts(day08.accumulator)

  puts(find_wrong_op(instructions).accumulator)
end
