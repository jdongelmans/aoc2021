#!/usr/bin/ruby

require 'matrix'

def generate_straight_line(starting, ending)
  start_x, start_y = starting
  end_x, end_y = ending

  Range.new(*[start_x, end_x].sort).flat_map do |i|
    Range.new(*[start_y, end_y].sort).collect do |j|
      [i, j]
    end
  end
end

def generate_diagonal_line(starting, ending)
  start_x, start_y = starting
  end_x, end_y = ending

  steps = (end_x - start_x).abs

  steps.times.collect do |i|
    right = [start_x, end_x].min == start_x
    down = [start_y, end_y].min == start_y

    [(right ? start_x + i : start_x - i), (down ? start_y + i : start_y - i)]
  end.push(ending)
end

def run(input, include_diagonals: false)
  inputs = input.map { |line| line.split(' -> ') }.map { |a, b| [a.split(',').map(&:to_i), b.split(',').map(&:to_i)] }
  max = inputs.map(&:max).map(&:max).max + 1 # super max max max
  matrix = Matrix.zero(max)

  inputs.each do |starting, ending|
    line =
      if starting[0] != ending[0] && starting[1] != ending[1]
        next unless include_diagonals

        generate_diagonal_line(starting, ending)
      else
        generate_straight_line(starting, ending)
      end

    line.each { |coordinate| matrix[*coordinate] += 1 }
  end

  matrix.count { |value| value >= 2 }
end

input = File.readlines('inputs/day05.txt')

puts "Day05::Part1 answer: #{run(input)}"
puts "Day05::Part2 answer: #{run(input, include_diagonals: true)}"
