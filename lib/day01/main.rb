#!/usr/bin/env ruby
# frozen_string_literal: true

def find_combo(desired_sum, input, count)
  input.combination(count).to_a.each do |combo|
    sum = combo.inject(0, :+)
    return combo if sum == desired_sum
  end
end

if $PROGRAM_NAME == __FILE__
  numbers = []
  File.foreach('inputs/day01.txt') do |line|
    numbers.push line.chomp.to_i
  end
  combo = find_combo(2020, numbers, 2)
  puts "#{combo.join(' + ')} == #{combo.inject(0, :+)}"
  puts "#{combo.join(' * ')} == #{combo.inject(1, :*)}"
  combo = find_combo(2020, numbers, 3)
  puts "#{combo.join(' + ')} == #{combo.inject(0, :+)}"
  puts "#{combo.join(' * ')} == #{combo.inject(1, :*)}"
end
