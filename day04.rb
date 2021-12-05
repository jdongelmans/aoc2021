#!/usr/bin/ruby

class BingoCard
  def initialize(card_data)
    @rows = card_data.split("\n").map { |row| row.split(" ").map(&:to_i) }
    @columns = @rows.transpose
  end

  def play(number)
    @rows.each { |row| row.delete(number) }
    @columns.each { |column| column.delete(number) }
  end

  def winner?
    @rows.any?(&:empty?) || @columns.any?(&:empty?)
  end

  def total_remaining
    @rows.sum(&:sum)
  end
end

def part1(bingo_cards, numbers)
  numbers.each do |number|
    bingo_cards.each { |card| card.play(number) }
    winners = bingo_cards.select(&:winner?)

    return winners.first.total_remaining * number if winners.any?
  end

end

def part2(bingo_cards, numbers)
  numbers.each do |number|
    bingo_cards.each { |card| card.play(number) }
    bingo_cards.delete_if(&:winner?) unless bingo_cards.one?

    return bingo_cards.first.total_remaining * number if bingo_cards.first.winner?
  end
end

bingo_data = File.read('inputs/day04.txt').split("\n\n")

numbers = bingo_data.shift.split(',').map(&:to_i)
bingo_cards = bingo_data.map { |card_data| BingoCard.new(card_data) }

puts "Day04::Part1 answer: #{part1(bingo_cards, numbers)}"
puts "Day04::Part2 answer: #{part2(bingo_cards, numbers)}"
