class Tile
  attr_reader :revealed, :marked, :value
  def initialize(bomb)
    @bomb = bomb
    @revealed = false
    @marked = false
    @value = 0
  end

end
