#!/usr/bin/ruby

def part1(input)
  prepared_input = (0..(input.first.length - 1)).map { |i| input.map { |l| l[i] } }

  zeroes = prepared_input.map { |i| i.count('0') }

  gamma = zeroes.map { |i| i < input.size / 2 ? 0 : 1 }.join
  epsilon = zeroes.map { |i| i > input.size / 2 ? 0 : 1 }.join

  gamma.to_i(2) * epsilon.to_i(2)
end

def calculate(input, select_value)
  (0..(input.first.length - 1)).each do |i|
    prepared_input = input.map { |l| l[i] }
    more_or_equal_ones = prepared_input.count('1') >= (prepared_input.size.to_f / 2).round
    input.select! { |j| j[i] == (more_or_equal_ones ? select_value.to_s : (1 - select_value).to_s) }

    return input.first if input.length == 1
  end

end

def part2(input)
  oxygen_result = calculate(input.dup, 1)
  co2_result = calculate(input.dup, 0)

  oxygen_result.to_i(2) * co2_result.to_i(2)
end

input = File.readlines('inputs/day03.txt').map(&:strip)
puts "Day03::Part1 answer: #{part1(input)}"
puts "Day03::Part2 answer: #{part2(input)}"
