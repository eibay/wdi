require 'pry'

# Goal: To create a program that chooses 3 cards at random,
# Have it output the cards and their blackjack value or
# Also include whether that value is "bust".
# Loop this program until there are no cards left in the deck.

cards = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]

all_cards = [cards * 4]

deck = all_cards.flatten

hand = []

randoms = deck.shuffle

3.times {hand.push randoms.delete_at(0)}

hand_1 = hand[0]
hand_2 = hand[1]
hand_3 = hand[2]


# shuffled_deck = deck.shuffle

# def deal(hand, shuffled_deck) 
# 3.times {hand.push shuffled_deck.delete_at(0)}
# return hand, shuffled_deck
# end

# hand, shuffled_deck = deal(hand, shuffled_deck)

# hand_1 = shuffled_deck[0]
# hand_2 = shuffled_deck[1]
# hand_3 = shuffled_deck[2]


# deal(hand, shuffled_deck)

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

if hand_3 == "Ace"
	card_3 = 1
elsif hand_3 == "Jack" 
	card_3 = 10
elsif hand_3 == "Queen"
	card_3 = 10
elsif hand_3 == "King"
	card_3 = 10
else
	card_3 = hand_3.to_i
end

total_value = card_1 + card_2 + card_3

if total_value > 21

puts "Your cards are #{hand_1}, #{hand_2} and #{hand_3}. Your total is #{total_value}. That's a bust!"

elsif total_value == 21
	puts "Your cards are #{hand_1}, #{hand_2} and #{hand_3}. Blackjack!"

else #total_value < 21
	puts "Your cards are #{hand_1}, #{hand_2} and #{hand_3}. Your total is #{total_value}."

end

# h = 0 

# while hand.length > h

# h = h + 1

# end

# deal(hand, shuffled_deck)

# puts "Play again?"
# response = gets.chomp.downcase

# s = 0

# while deal(hand, shuffled_deck) > s

# deal(hand, shuffled_deck)

# if deal(hand, shuffled_deck) = 0
# 	puts "Sorry, you're out of cards."

# else 
# 	puts "Thanks for playing!"
# end

# s = s + 1

# end