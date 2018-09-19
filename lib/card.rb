class Card
  # Your code here
  attr_reader :suit, :rank, :value

  LETTER_RANK_VALUES = {
    'J' => 11,
    'Q' => 12,
    'K' => 13
  }

  def initialize(rank, suit)
    @suit = suit
    @rank = rank
    @value = calculate_card_value
  end

  def calculate_card_value
    if LETTER_RANK_VALUES.include?(rank)
      @value = LETTER_RANK_VALUES[rank]
    else
      @value = rank.to_i
    end
  end

  # Methods you may need:
  # - initialize
  # - method that assigns all cards their "values",
  #  so that we can determine which card has a higher value in a round
  # - attribute readers
  # - any other methods you deem necessary
end
