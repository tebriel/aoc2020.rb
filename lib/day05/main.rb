# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
def find_position(chars, total)
  space = (0..(total - 1)).to_a
  chars.split('').each do |char|
    half = (space.length / 2) - 1
    space = if %w[F L].include? char
              (space.first..(space.first + half)).to_a
            else
              ((space.first + half + 1)..space.last).to_a
            end
  end
  space[0]
end
# rubocop:enable Metrics/AbcSize

def read_pass(chars)
  row_chars = chars[0..6]
  col_chars = chars[7..]
  row = find_position(row_chars, 128)
  col = find_position(col_chars, 8)
  seat_id = (row * 8) + col
  [row, col, seat_id]
end

if $PROGRAM_NAME == __FILE__
  seatmap = []
  (0..127).each do |_row|
    seatmap.append(['O'] * 8)
  end

  highest_id = 0
  File.foreach('inputs/day05.txt') do |line|
    row, col, seat_id = read_pass(line.chomp)
    seatmap[row][col] = 'X'
    highest_id = seat_id if seat_id > highest_id
  end
  puts "Part01: Highest Seat ID: #{highest_id}"
  seatmap.each_with_index do |row, idx|
    next unless row.include?('X')
    next unless row.include?('O')
    next unless seatmap[idx - 1].all?('X')
    next unless seatmap[idx + 1].all?('X')

    puts("Part02: Row: #{idx}, Column: #{row.find_index('O')}, ID: #{idx * 8 + row.find_index('O')}")
  end
end
