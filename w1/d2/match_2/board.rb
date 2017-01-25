require_relative 'card'

class Board

  attr_reader :board
  attr_accessor :pairs_left

  def initialize
    @board = Array.new(4) { Array.new(4) }
  end

  def won?
    @board.flatten.all?(&:face_up?)
  end

  def populate
    # fills the board with two of each value from 0 to 7

    values = ((0..7).to_a * 2).shuffle
    4.times do |i|
      4.times do |j|
        pos = [i, j]
        self[pos] = Card.new(values.pop)
      end
    end
    nil
  end

  def render
    system "clear"
    @board.each do |line|
      p line.map(&:to_s)
    end
    nil
  end

  def face_up?(pos)
    self[pos].face_up
  end

  def reveal(pos)
    self[pos].reveal
    self[pos].num
  end

  def hide(pos)
    self[pos].hide
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
