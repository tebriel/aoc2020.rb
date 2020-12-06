# frozen_string_literal: true

require 'set'

# Handle any question that anyone said yes to
class GroupResponses
  def initialize
    @answers = Set.new
  end

  def log_answers(resps)
    resps.split('').each do |resp|
      @answers.add(resp)
    end
  end

  def yeses
    @answers.count
  end
end

# Handle the yeses that everyone had
class GroupResponses2
  def initialize
    @answers = {}
    @group_count = 0
  end

  def log_answers(resps)
    @group_count += 1
    resps.split('').each do |resp|
      @answers[resp] ||= 0
      @answers[resp] += 1
    end
  end

  def yeses
    (@answers.filter { |_key, value| value == @group_count }).count
  end
end

if $PROGRAM_NAME == __FILE__
  groups = [GroupResponses.new]
  File.foreach('inputs/day06.txt') do |line|
    groups.append(GroupResponses.new) if line.chomp.empty?
    group = groups.last
    group.log_answers(line.chomp)
  end

  puts(groups.sum(&:yeses))

  groups = [GroupResponses2.new]
  File.foreach('inputs/day06.txt') do |line|
    if line.chomp.empty?
      groups.append(GroupResponses2.new)
      next
    end
    group = groups.last
    group.log_answers(line.chomp)
  end

  puts(groups.sum(&:yeses))
end
