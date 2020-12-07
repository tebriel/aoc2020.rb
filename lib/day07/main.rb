# frozen_string_literal: true

require 'set'

# Encapsulation for the rule and it's contents
class Rule
  attr_reader :color, :contents

  def initialize(color, contains)
    @color = color
    @contents = {}
    contains.each do |contain|
      data = /(?<count>\d+) (?<color>.*) bags?\.?/.match(contain)
      @contents[data['color']] = data['count'].to_i
    end
  end

  def can_contain?(color_check)
    @contents.key?(color_check)
  end

  def child_count(roots)
    # Minus 1 for the root bag
    count_children(@color, roots) - 1
  end

  private

  def count_children(color, roots)
    # puts "Counting #{color}"
    roots[color].contents.keys.sum do |key|
      child_count = count_children(key, roots)
      child_count = 1 if child_count.zero?
      # puts "#{color}: #{key} * #{child_count}"
      # puts "#{roots[color].contents[key]} * #{child_count}"
      (roots[color].contents[key] * child_count)
    end + 1
  end
end

def find_container_colors(roots)
  bag_colors = Set.new
  to_search = Set.new(['shiny gold'])

  while to_search.count.positive?
    item = to_search.to_a[0]
    roots.each do |key, value|
      next unless value.can_contain?(item)

      to_search.add(key)
      bag_colors.add(key)
    end
    to_search.delete(item)
  end

  bag_colors
end

def process_rules(rules)
  roots = {}

  rules.each do |line|
    data = /^(?<color>.*) bags contain (?<contents>.*)\.$/.match(line)
    color = data['color']
    contents = data['contents'].split(', ')
    contents = [] if contents[0] == 'no other bags'
    roots[color] = Rule.new(color, contents)
  end

  bag_colors = find_container_colors(roots)

  [bag_colors.count, roots['shiny gold'].child_count(roots)]
end

if $PROGRAM_NAME == __FILE__
  rules = []
  File.foreach('inputs/day07.txt') do |line|
    rules.append(line.chomp)
  end
  puts(process_rules(rules))
end
