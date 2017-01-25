class HumanPlayer
  attr_accessor :previous_guess

  def initialize
    @previous_guess = nil
  end

  def get_input
    prompt
    parse(STDIN.gets.chomp)
  end

  def prompt
    puts "Please enter the position in the form 'row,col'"
    print "> "
  end

  def parse(string)
    string.split(",").map { :to_i }
  end

  def receive_revealed_card(pos, value)
    # duck typing
  end

  def receive_match(pos1, pos2)
    # duck_typing
  end

end

class ComputerPlayer
  attr_accessor :previous_guess

  def initialize
    @matched_cards = {}
    @known_cards = {}
    @previous_guess = nil
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end

  def get_input
    if @previous_guess
      second_guess
    else
      first_guess
    end
  end

  def unmatched_pos
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) &&
          !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end

    pos
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] &&
        !@matched_cards[pos]
    end

    pos
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

  def random_guess
    guess = nil

    until guess && !@known_cards[guess]
      guess = [rand(0..3), rand(0..3)]
    end

    guess
  end
end
