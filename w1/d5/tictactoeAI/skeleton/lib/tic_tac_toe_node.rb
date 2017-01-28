require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    find_emptys.each do |empty_square|
      new_board = @board.dup
      new_board[empty_square] = @next_mover_mark
      children << TicTacToeNode.new(new_board, @next_mover_mark, empty_square)
    end
    swap_mark
    @children = children
    children
  end



  def find_emptys
    emptys = []
    (0..2).each do |row|
      (0..2).each do |col|
        emptys << [row, col] if @board.empty?([row, col])
      end
    end
    emptys
  end

  def winning_node?(evaluator)
    return true if @board.winner == :o
    self.children.each do |child|
      child.winning_node?(evaluator)
    end
    false
  end

  def losing_node?(evaluator)
    return true if @board.winner == :x
    self.children.each do |child|
      child.winning_node?(evaluator)
    end
    false
  end

  private
  def swap_mark
    @next_mover_mark == :x ? @next_mover_mark = :o : @next_mover_mark = :x
  end



end
