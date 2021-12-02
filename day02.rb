#!/usr/bin/ruby

class Part1
  def self.run(inputs)
    horizontal = 0
    depth = 0

    inputs.each do |direction, amount|
      case direction
      when 'forward'
        horizontal += amount.to_i
      when 'down'
        depth += amount.to_i
      when 'up'
        depth -= amount.to_i
      end
    end

    horizontal * depth
  end
end

class Part2
  def self.run(inputs)
    horizontal = 0
    depth = 0
    aim = 0

    inputs.each do |direction, amount|
      case direction
      when 'forward'
        horizontal += amount.to_i
        depth += amount.to_i * aim
      when 'down'
        aim += amount.to_i
      when 'up'
        aim -= amount.to_i
      end
    end

    horizontal * depth
  end
end

inputs = File.readlines('inputs/day02.txt').map { |input| input.split(' ') }

puts "Day02::Part1 answer: #{Part1.run(inputs)}"
puts "Day02::Part2 answer: #{Part2.run(inputs)}"
