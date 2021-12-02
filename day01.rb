#!/usr/bin/ruby

input = File.readlines('inputs/day01.txt').map(&:to_i)
result1 = input.each_cons(2).count { |a, b| b > a }
result2 = input.each_cons(3).map(&:sum).each_cons(2).count { |a, b| b > a }

puts "Day01::Part1 answer: #{result1}"
puts "Day01::Part2 answer: #{result2}"
