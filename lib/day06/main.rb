# frozen_string_literal: true

if $PROGRAM_NAME == __FILE__
  lines = []
  File.foreach('inputs/day06.txt') do |line|
    lines.append(line.chomp)
  end
end
