#!/usr/bin/ruby

require 'matrix'

def generate_straight_line(starting, ending)
  x1, y1 = starting
  x2, y2 = ending

  xs = x1 == x2 ? [x1] : (x1..x2).step(x2 <=> x1).to_a
  ys = y1 == y2 ? [y1] : (y1..y2).step(y2 <=> y1).to_a

  xs.product(ys)
end

def generate_diagonal_line(starting, ending)
  x1, y1 = starting
  x2, y2 = ending

  xs = (x1..x2).step(x2 <=> x1)
  ys = (y1..y2).step(y2 <=> y1)

  xs.zip(ys)
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
