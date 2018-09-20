# Created by Saad Naveed...not like anyone cares tho #
# created: 7/13/18
require_relative "deck"
require_relative "hand"
require_relative "round"

class War
  attr_reader :computer_score, :player_score

  def initialize
    @deck = Deck.new

    # Each of the instance variables below should store a Hand object.
    # Each hand object should hold an array of cards for a player.
    # You may wish to define a method on the 'Deck' in order to help retrieve cards
    # from your 'deck' object and pass them to a 'Hand' object
    # @player_hand = ...
    # @computer_hand = ...
    @player_hand = Hand.new(@deck.deal_hand_cards)
    @computer_hand = Hand.new(@deck.deal_hand_cards)
    @computer_score = @player_hand.score
    @player_score = @player_hand.score
  end

  def play_round
    puts "You have #{@player_hand.score} cards in your hand."
    round = Round.new(@player_hand.draw, @computer_hand.draw)
    puts "Players card value: #{round.player_card.value}"
    puts "Computers card value: #{round.computer_card.value}"

    if round.player_wins?
      # resolve what happens to both opponents hands when the player wins the round
      @player_hand.won(round.player_card, round.computer_card)

      puts "You win the round!"
    else
      # resolve what happens to both opponents hands when the computer wins the round
      @computer_hand.won(round.computer_card, round.player_card)

      puts "Computer wins the round!"

    end
    puts

    @computer_score = @computer_hand.score
    @player_score = @player_hand.score

    # shuffle the cards again
    @player_hand.shuffle
    @computer_hand.shuffle

  end

  def game_over?
    @computer_score == 0 || @player_score == 0
  end

  def game_winner
    if @computer_score == 0
      puts "Computer is out of cards, you win!"
    else
      puts "You are out of cards, Computer wins!"
    end
  end
end
