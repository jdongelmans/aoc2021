#!/usr/bin/ruby

def part1(input)
  input.each_with_object({ horizontal: 0, depth: 0 }) do |(direction, amount), hash|
    case direction
    when 'forward'
      hash[:horizontal] += amount.to_i
    when 'down'
      hash[:depth] += amount.to_i
    when 'up'
      hash[:depth] -= amount.to_i
    end
  end.values.inject(:*)
end

def part2(input)
  input.each_with_object({ horizontal: 0, depth: 0, aim: 0 }) do |(direction, amount), hash|
    case direction
    when 'forward'
      hash[:horizontal] += amount.to_i
      hash[:depth] += amount.to_i * hash[:aim]
    when 'down'
      hash[:aim] += amount.to_i
    when 'up'
      hash[:aim] -= amount.to_i
    end
  end.fetch_values(:horizontal, :depth).inject(:*)
end

input = File.readlines('inputs/day02.txt').map { |line| line.split(' ') }

puts "Day02::Part1 answer: #{part1(input)}"
puts "Day02::Part2 answer: #{part2(input)}"
