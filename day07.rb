#!/usr/bin/ruby

def part1(input)
  sorted = input.sort
  length = sorted.length
  median = (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0

  input.sum { |crab| (median - crab).abs }.to_i
end

def part2(input)
  average = ((input.sum.to_f - input.size) / input.size).round
  input.sum { |crab| (1..(average - crab).abs).inject(0, :+) }
end

input = File.read('inputs/day07.txt').split(',').map(&:to_i)

puts "Day07::Part1 answer: #{part1(input)}"
puts "Day07::Part2 answer: #{part2(input)}"
