class Hand
  # Your code here
  def initialize(cards)
    @cards = cards
  end
  # Methods you may need:
  # - initialize
  # - method that returns the number of cards in a hand,
  #  which represents that opponents score.
  # - attribute readers
  # - any other methods you deem necessary

  def draw
    # returns the last card in the player's hand
    @cards.shift
  end

  def score
    # determines how many cards are in a hand
    @cards.length
  end

  def won(winner, loser)
    @cards.push(winner)
    @cards.push(loser)
  end

  def shuffle
    @cards.shuffle!
  end

end
