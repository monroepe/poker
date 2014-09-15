# require_relative 'card'
# require_relative 'deck'
# require_relative 'hand'
# require 'pry'

# class Scorer

#   attr_reader :hand, :card_scores, :suits

#   def initialize(hand)
#     @hand = hand
#     @card_scores = hand.card_scores
#     @suits = hand.suits
#   end

# def card_count?(count)
#     @card_scores.each do |card|
#       if @card_scores.count(card) == count
#         return true
#       end
#     end
#     false
#   end

# #determines what exists in hands#####
#   def pair?
#     @card_scores.uniq.length == (@card_scores.length - 1)
#   end

#   def two_pair?
#     @card_scores.uniq.length == (@card_scores.length - 2) && !three_of_a_kind?
#   end

#   def three_of_a_kind?
#     card_count?(3)
#   end

#   def straight?
#     all_poker_straights = [14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].each_cons(5)
#     @card_scores.each_cons(5) { |hand|
#       if all_poker_straights.include?(hand)
#         return true
#       end
#     }
#     false
#   end

#   def flush?
#     @suits.each do |suit|
#       if @suits.count(suit) > 4
#         return true
#       end
#     end
#     false
#   end

#   def full_house?
#     if !three_of_a_kind?
#       return false
#     else
#       card_count?(2)
#     end
#   end

#   def four_of_a_kind?
#     card_count?(4)
#   end

#   def straight_flush?
#     flush? && straight?
#   end

# #################################

# #with array of cards and determines the best 5 card hand
#   def best_hand
#     case
#     when pair?
#       get_pair
#     when two_pair?
#       get_two_pair
#     when three_of_a_kind? && !full_house?
#       get_three_of_a_kind
#     when straight? && !straight_flush?
#       get_straight
#     when flush? && !straight_flush?
#       get_flush
#     when full_house?
#       get_full_house
#     when four_of_a_kind?
#       get_four_of_a_kind
#     when straight_flush?
#       get_straight_flush
#     end
#   end

# end
