require_relative 'card'
require_relative 'deck'
require 'pry'

class Hand

  attr_reader :cards, :card_scores

  def initialize(cards)
    @cards = cards
    @best_hand = best_hand
    @card_scores = cards_converter
    @suits = suits
  end

#converts hand from array of card to array of scores of said cards
  def cards_converter
    scores = []

    @cards.each do |card|
      scores << card.score
    end

    scores

  end

  def suits
    suits = []

    @cards.each do |card|
      suits << card.suit
    end
    suits
  end

#gets the highest card
  def high_card
    @cards.max
  end

#determines what exists in hands#####
  def pair?
    @card_scores.uniq.length == (@card_scores.length - 1)
  end

  def two_pair?
    @card_scores.uniq.length == (@card_scores.length - 2) && !three_of_a_kind?
  end

  def three_of_a_kind?
    @card_scores.each do |card|
      if @card_scores.count(card) == 3
        return true
      end
    end
    false
  end

  def straight?

  end

  def flush?
    @suits.each do |suit|
      if @suits.count(suit) > 4
        return true
      end
    end
    false
  end

  def full_house?
  end

  def four_of_a_kind?
  end

  def straight_flush?
  end

  def royal_flush?
  end

#################################

#with array of cards and determines the best 5 card hand
  def best_hand
    #returns 5 card hand
    #best
  end

#compares two hands
  def compare
  end

end
