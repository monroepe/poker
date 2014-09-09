require_relative 'card'

class Deck
  SUITS = ['♥', '♦', '♠', '♣']
  VALUES = ['K', 'Q', 'J', 'A', '2', '3', '4', '5', '6', '7', '8', '9', '10']

  attr_accessor :cards

  def initialize
    @cards = make_deck
  end

  def make_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(value, suit)
      end
    end
    deck.shuffle
  end

  def deal_card
    cards.pop
  end

  def shuffle
    cards.shuffle
  end
end
