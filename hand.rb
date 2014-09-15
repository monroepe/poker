require_relative 'card'
require_relative 'deck'
require 'pry'

class Hand

  attr_reader :cards, :card_scores

  def initialize(cards)
    @cards = cards
    @card_scores = card_scores
    @suits = suits
    @cards_by_score = cards_by_score
    @best_hand = best_hand
  end

#converts hand from array of card to array of sorted scores of said cards
  def cards_by_score
    scores = {}

    @cards.each do |card|
      scores[card] = card.score
    end

    Hash[scores.sort_by { |card, score| -score }]

  end

  def card_scores
    scores = []

    @cards.each do |card|
      scores << card.score
    end

    scores.sort
  end

  def suits
    suits = []

    @cards.each do |card|
      suits << card.suit
    end
    suits
  end

  def card_count?(count)
    @card_scores.each do |card|
      if @card_scores.count(card) == count
        return true
      end
    end
    false
  end

#check if only 5 cards in hand already
  def hand?
    @cards_by_score.length == 5
  end

#determines what exists in hands#####
  def pair?
    @card_scores.uniq.length == (@card_scores.length - 1)
  end

  def two_pair?
    @card_scores.uniq.length == (@card_scores.length - 2) && !three_of_a_kind?
  end

  def three_of_a_kind?
    card_count?(3)
  end

  def straight?
    all_poker_straights = [14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].each_cons(5)
    @card_scores.each_cons(5) { |hand|
      if all_poker_straights.include?(hand)
        return true
      end
    }
    false
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
    if !three_of_a_kind?
      return false
    else
      card_count?(2)
    end
  end

  def four_of_a_kind?
    card_count?(4)
  end

  def straight_flush?
    flush? && straight?
  end

#################################

####gets best hand with given type

  def get_high_cards(cards)
    @cards_by_score.each_key do |card|
      if cards.length < 5 && !cards.include?(card)
        cards << card
      end
    end
  end

#returns an array of card with given number of multiples
  def get_multiples(number)
    cards = []

    @cards_by_score.each_key do |card|
      if @card_scores.count(card.score) == number
        cards << card
      end
    end

    cards

  end

  def get_pairs
    cards = get_multiples(2)

    get_high_cards(cards)

    cards
  end

  def get_three_of_a_kind
    cards = get_multiples(3)

    get_high_cards(cards)

    cards
  end

  def get_straight
    straight = []
    all_poker_straights = [14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].each_cons(5)
    scores = []

    @cards_by_score.values.reverse.each_cons(5) { |hand|
      if all_poker_straights.include?(hand)
        scores = hand
      end
    }

    scores.each do |score|
      straight << @cards_by_score.key(score)
    end

    straight

  end

  def get_flush
    cards = []

     @cards_by_score.each_key do |card|
      if cards.length < 5 && (@suits.count(card.suit) > 4)
        cards << card
      end
    end

    cards
  end

  def get_full_house
    cards = get_multiples(3)

    cards.concat(get_multiples(2))
  end

  def get_four_of_a_kind
    cards = get_multiples(4)

    get_high_cards(cards)

    cards
  end

  def get_straight_flush

  end

################################

#with array of cards and determines the best 5 card hand
  def best_hand
    case
    when hand?
      return @cards
    when pair? && !hand?
      get_pairs
    when two_pair? && !hand?
      get_pairs
    when three_of_a_kind? && !full_house? && !hand?
      get_three_of_a_kind
    when straight? && !straight_flush? && !hand?
      get_straight
    when flush? && !straight_flush? && !hand?
      get_flush
    when full_house? && !hand?
      get_full_house
    when four_of_a_kind? && !hand?
      get_four_of_a_kind
    when straight_flush? && !hand?
      get_straight_flush
    else
      get_high_card
    end
  end

#compares two hands
  def compare
  end

end
