require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require 'pry'


deck = Deck.new
rand_hand = []
7.times { rand_hand << deck.deal_card }

high_card_hand = [Card.new("J", "♦"),
                  Card.new("9", "♣"),
                  Card.new("4", "♥"),
                  Card.new("6", "♦"),
                  Card.new("5", "♥"),
                  Card.new("2", "♣"),
                  Card.new("3", "♦")]

one_pair_hand = [Card.new("J", "♦"),
                Card.new("9", "♣"),
                Card.new("4", "♥"),
                Card.new("6", "♦"),
                Card.new("5", "♥"),
                Card.new("2", "♦"),
                Card.new("9", "♥")]

two_pair_hand = [Card.new("J", "♦"),
                Card.new("9", "♣"),
                Card.new("2", "♥"),
                Card.new("6", "♦"),
                Card.new("5", "♥"),
                Card.new("2", "♦"),
                Card.new("9", "♥")]


three_of_a_kind_hand = [Card.new("J", "♦"),
                        Card.new("9", "♣"),
                        Card.new("4", "♥"),
                        Card.new("6", "♦"),
                        Card.new("5", "♥"),
                        Card.new("9", "♦"),
                        Card.new("9", "♥")]

four_of_a_kind_hand = [Card.new("9", "♠"),
                      Card.new("9", "♣"),
                      Card.new("4", "♥"),
                      Card.new("6", "♦"),
                      Card.new("5", "♥"),
                      Card.new("9", "♦"),
                      Card.new("9", "♥")]

straight_hand = [Card.new("2", "♦"),
                Card.new("3", "♣"),
                Card.new("4", "♥"),
                Card.new("5", "♦"),
                Card.new("6", "♥"),
                Card.new("K", "♦"),
                Card.new("9", "♥")]

straight_flush_hand = [Card.new("2", "♦"),
                        Card.new("3", "♦"),
                        Card.new("4", "♦"),
                        Card.new("5", "♦"),
                        Card.new("6", "♦"),
                        Card.new("K", "♥"),
                        Card.new("9", "♥")]

full_house_hand = [Card.new("J", "♦"),
                  Card.new("9", "♣"),
                  Card.new("4", "♥"),
                  Card.new("J", "♦"),
                  Card.new("5", "♥"),
                  Card.new("9", "♦"),
                  Card.new("9", "♥")]

flush_hand = [Card.new("2", "♦"),
            Card.new("3", "♦"),
            Card.new("4", "♦"),
            Card.new("7", "♦"),
            Card.new("6", "♦"),
            Card.new("K", "♥"),
            Card.new("9", "♥")]


high_card = Hand.new(high_card_hand)
one_pair = Hand.new(one_pair_hand)
two_pair = Hand.new(two_pair_hand)
three_of_a_kind = Hand.new(three_of_a_kind_hand)
four_of_a_kind = Hand.new(four_of_a_kind_hand)
straight = Hand.new(straight_hand)
flush = Hand.new(flush_hand)
full_house = Hand.new(full_house_hand)
straight_flush = Hand.new(straight_flush_hand)
binding.pry
