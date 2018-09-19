require_relative "card"

class Deck
  # SUITS = ['♦', '♣', '♠', '♥']
  # RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  # For your first pass at this assignment, we advise having a smaller deck with one suit.
  SUITS = ['♦']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  CARDS_PER_PERSON = 6

  def initialize
    @cards = build_deck
  end

  def build_deck
    # For every element in SUITS, iterate over every element in RANKS, and create a Card object. Then shuffle the deck.
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!

    return cards
  end

  def deal_hand_cards
     # removes half of the cards from the @cards array and returns them
     # review the Ruby Docs online to see a list of Array methods that may help
     range = CARDS_PER_PERSON - 1
     @cards.slice!(0..range)
  end
end
