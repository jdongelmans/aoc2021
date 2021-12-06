#!/usr/bin/ruby

def naive(input, days)
  time = Time.now
  fish = input.dup

  days.times do
    fish.dup.each_with_index do |current, idx|
      case current
      when 0
        fish[idx] += 6
        fish.push(8)
      when 1..8
        fish[idx] -= 1
      end
    end
  end

  puts "Naive runtime #{days} days: #{Time.now - time}s"
  fish.count
end

def improved(input, days)
  time = Time.now
  fish = 0.upto(8).each_with_object({}) { |i, hash| hash[i] = 0 }
  input.tally.each do |k, v|
    fish[k] += v
  end

  days.times do |i|
    fish.dup.each do |value, amount|
      case value
      when 0
        fish[6] += amount
        fish[8] += amount
        fish[0] = 0
      when 1..8
        fish[value - 1] += amount
        fish[value] -= amount
      end
    end
  end

  puts "Improved runtime #{days} days: #{Time.now - time}s"
  fish.sum { |_, v| v }
end

input = File.read('inputs/day06.txt').split(',').map(&:to_i)

puts "Day06::Part1 answer: #{naive(input, 80)}"
puts "Day06::Part2 answer: #{improved(input, 256)}"
