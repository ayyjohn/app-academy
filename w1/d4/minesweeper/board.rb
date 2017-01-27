require_relative 'tile'

class Board
  attr_accessor :grid

  def initialize()
    @grid = Array.new(9) { Array.new(9) }
    self.set_up
  end

  def set_up
    @grid.each_index do |row|
      @grid.each_index do |col|
         self[[row,col]]= (rand(90) % 10 == 0 ? Tile.new(true) : Tile.new(false))
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, mark)
    x, y = pos
    @grid[x][y] = mark
  end

  def display_for_user

    @grid.each do |row|
      row.each do |tile|
        if tile.revealed
          print " "
        else
          print "x" if !tile.marked
          print "B" if tile.marked
        end
      end
      puts
    end
    nil
  end

end
