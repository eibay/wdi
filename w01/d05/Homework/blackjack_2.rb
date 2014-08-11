require 'pry'

# Goal: To create a program that chooses two cards from the deck at random and outputs its value in blackjack.
# To calculate the value of a hand of cards:
# 2-10 have the value of their number
# All face cards have the value of 10
# Ace is 1

# Generates full deck
#all_cards = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
# suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
#deck = [all_cards, all_cards, all_cards, all_cards]
# deck = []
#hand = []

# all_cards.each { |c|
# suits.each { |s|
# individual_card = c + " of " + s 
# deck.push(individual_card) 
# }
# }

cards = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]

all_cards = [cards * 4]

deck = all_cards.flatten

hand = []

randoms = deck.shuffle
2.times {hand.push randoms.delete_at(0)}

hand_1 = hand[0]
hand_2 = hand[1]

if hand_1 == "Ace"
	card_1 = 1
elsif hand_1 == "Jack" 
	card_1 = 10
elsif hand_1 == "Queen"
	card_1 = 10
elsif hand_1 == "King"
	card_1 = 10
else
	card_1 = hand_1.to_i
end

if hand_2 == "Ace"
	card_2 = 1
elsif hand_2 == "Jack" 
	card_2 = 10
elsif hand_2 == "Queen"
	card_2 = 10
elsif hand_2 == "King"
	card_2 = 10
else
	card_2 = hand_2.to_i
end

total_value = card_1 + card_2
puts "Your cards are #{hand_1} and #{hand_2}. Your total is #{total_value}."
