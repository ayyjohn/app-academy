require_relative 'card.rb'

class Board

  attr_reader :board
  attr_accessor :pairs_left

  def initialize
    @board = Array.new(4) { Array.new(4) }
    @pairs_left = 8
  end

  def populate
    # fills the board with two of each value from 0 to 7

    values = ((0..7).to_a * 2).shuffle
    4.times do |i|
      4.times do |j|
        pos = [i,j]
        self[pos] = Card.new(values.pop)
      end
    end
    nil
  end

  def render
    @board.each do |line|
      p line.map { |card| card.to_s }
    end
    nil
  end

  def won?
    @pairs_left == 0
  end

  def reveal(pos)
    self[pos].num
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end
end
