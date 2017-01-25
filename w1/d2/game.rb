require_relative 'board.rb'
require_relative 'player.rb'

class Game

  def initialize
    @board = Board.new
    @player = HumanPlayer.new('alec')
    @previous_guess = nil
  end

  def play
    # simulates a full game of Memory. populates the board randomly
    # then until the user has made 8 matches (all) the board will render
    # and recieve player guesses.
    # it will also send back info to the player such as
    # what the value was at the last guess and if there was a match made
    
    @board.populate

    until @board.won?
      @board.render
      pos = @player.get_guess

      make_guess(pos)

    end
    puts "you did it!"

  end

  def first_guess
    @previous_guess.nil?
  end

  def make_guess(pos)
    if first_guess
      @board[pos].reveal
      @previous_guess = pos
    else
      card1 = @board[pos]
      card2 = @board[@previous_guess]

      if is_match?(card1, card2)
        card1.reveal
        card2.reveal
        @previous_guess = nil
        @board.pairs_left -= 1
        @board.render
      else
        card1.reveal
        @board.render

        card1.hide
        card2.hide
        @previous_guess = nil
      end
      sleep(2)
      system "clear"
    end
  end

  def is_match?(card1, card2)
    card1 == card2
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
