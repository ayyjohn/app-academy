require_relative 'player'

class Game

  attr_accessor :fragment, :player1, :player2, :current_player, :previous_player
  attr_reader :dictionary

  def initialize(dict_file, player1, player2)
    @dictionary = read_dict(dict_file)
    @player1 = player1
    @player2 = player2
    @fragment = ""
    @current_player = @player1
    @previous_player = nil
  end

  def read_dict(file)
    dict_hash = Hash.new(false)
    contents = File.open(file).readlines
    contents.each do |word|
      dict_hash[word.chomp] = true
    end
    dict_hash
  end

  def switch_players
    if @current_player == @player1
      @previous_player = @current_player
      @current_player = @player2
    else
      @previous_player = @current_player
      @current_player = @player1
    end
  end

  def play

    until loses?
      take_turn(@current_player)
    end

    puts "GAME OVER !!"
  end

  def valid_play?(letter)
    valid = false
    if letter?(letter)
      @fragment += letter
      valid = @dictionary.any? do |key, value|
        key.start_with?(@fragment)
      end
    end
    @fragment = @fragment[0...-1]
    valid
  end

  def letter?(letter)
    letter = letter.downcase
    letter >= 'a' && letter <= 'z' && letter.length == 1
  end

  def take_turn(player)
    guess = player.guess

    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end

    @fragment += guess

    if loses?
      puts "#{@previous_player} WINS!!"
    else
      switch_players
    end
  end

  def loses?
    @dictionary.any? do |key, value|
      @fragment == key
    end
  end
  
end

if __FILE__ == $PROGRAM_NAME
  Game.new("dictionary.text", "Alec", "Fariba").play
end
