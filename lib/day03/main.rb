# frozen_string_literal: true

# A map of the forest for our tobbagan
class Map
  def initialize(map_rows)
    @data = map_rows
    @width = map_rows[0].length
    @height = map_rows.length
  end

  def tree?(x_coord, y_coord)
    x = x_coord % @width
    y = y_coord

    @data[y][x] == '#'
  end

  def path_tree_count(slope)
    coords = [0, 0]
    trees = 0
    until coords[1] > @height - 1
      trees += 1 if tree?(coords[0], coords[1])
      coords[0] += slope[0]
      coords[1] += slope[1]
    end
    trees
  end
end

if $PROGRAM_NAME == __FILE__
  map_lines = []
  File.foreach('inputs/day03.txt') do |line|
    map_lines.append(line.chomp.split(''))
  end
  map = Map.new(map_lines)
  p("Slope [3, 1] trees = #{map.path_tree_count([3, 1])}")

  part2 = [
    map.path_tree_count([1, 1]),
    map.path_tree_count([3, 1]),
    map.path_tree_count([5, 1]),
    map.path_tree_count([7, 1]),
    map.path_tree_count([1, 2])
  ]
  p(part2)
  p(part2.inject(1, :*))
end
