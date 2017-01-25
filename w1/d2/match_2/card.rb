class Card

  attr_reader :num, :face_up

  def initialize(num)
    @num = num
    @face_up = false
  end

  def hide
    # changes a card to not reveal its value

    @face_up = false
  end

  def face_up?
    @face_up
  end
  
  def reveal
    # changes a card to reveal its value

    @face_up = true
  end

  def to_s
    # returns a string of the card's value if it is face up
    # otherwise returns "X"

    if @face_up
      @num.to_s
    else
      "X"
    end

  end

  def ==(other_card)
    # checks to see if one card is equal to another by comparing
    # their respective values

    @num == other_card.num && other_card.is_a?(self.class)
  end

end
