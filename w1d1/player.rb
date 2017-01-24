require_relative 'game'

class Player

  def initialize(name)
    @name = name
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess
    puts "Your guess is not valid."
  end

end
