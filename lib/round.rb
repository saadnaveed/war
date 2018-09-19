# This class will be where you determine which cards are of higher value
class Round
  attr_reader :player_card, :computer_card
  
  def initialize(player_card, computer_card)
    @player_card = player_card
    @computer_card = computer_card
  end

  def player_wins?
    # return true if the player wins the round
    @player_card.value > @computer_card.value
  end

  def computer_wins?
    @computer_card.value > @player_card.value
  end
end
