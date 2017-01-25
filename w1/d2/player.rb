require_relative 'board.rb'
require_relative 'game.rb'

class HumanPlayer

  def initialize(name)
    @name = name
    @known_cards
    @matched_cards
  end

  def get_guess
    puts "please make a row, col guess"
    gets.chomp.split(',').map(&:to_i)
  end

  def receive_revealed_card
  end

  def receive_match
  end

end

class ComputerPlayer
  attr_accessor :known_cards, :matched_positions

  def initialize(name)
    @name = name
    @known_cards = Hash.new { |h, k| h[k] = [] }
    @matched_positions = []
  end

  def get_guess
    puts "please make a row, col guess"
    gets.chomp.split(',').map(&:to_i)
  end

  def receive_revealed_card(num, pos)
    @known_cards[num] << pos
  end

  def receive_match(pos1, pos2)
    @matched_positions << pos1
    @matched_positions << pos2
  end

  def get_guess
    if (@known_cards.select { |_,pos| pos.length == 2 }).count > 0
      match = [@known_cards.to_a.sample].to_h
      matched_num = match[keys]
      match[matched_num]
  end

end
