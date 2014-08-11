## Blackjack

###Part 1
# - Create an array with all the cards in a deck (2-10, J, Q, K A)
# - **Don't** explicitly just write out an array with 52 cards
#   - You can write out a smaller array and then generate the rest
# - Output the array of cards
# ------

# hand_value = 0  

# marks = ["♠", "♥", "♦", "♣"]
# numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
# deck = []
# hand = []

# numbers.each { |number|
# marks.each { |mark|
# 	card = number + mark
# 	deck.push(card)
# }
# }

# print deck

# -----

###Part 2
# - Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
# - To calculate the value of a hand of cards:
#   - 2-10 have the value of their number
#   - All face cards have the value of 10
#   - Ace is 1

# hand_value = 0
# i = 0

# marks = ["♠", "♥", "♦", "♣"]
# numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
# deck = []
# hands = []
# value = 0

# numbers.each { |number|
# marks.each { |mark|
# 	card = number + mark
# 	deck.push(card)
# }
# }

# 2.times {
# 	hands << deck.sample
# }

# puts "Choices are #{hands}"

# hands.each { |hand|
# 	case hand.chr
# 	when "A"
# 		value += 1
# 	when "2"
# 		value += 2
# 	when "3"
# 		value += 3
# 	when "4"
# 		value += 4
# 	when "5"
# 		value += 5
# 	when "6"
# 		value += 6
# 	when "7"
# 		value += 7
# 	when "8"
# 		value += 8
# 	when "9"
# 		value += 9
# 	else
# 		value += 10
# 	end
# }

# puts "Point is #{value}"

# -----

###Part 3
# - Goal: To create a program that chooses 3 cards *at random*,
# - Have it output the cards and their blackjack value or
#   - Also include whether that value is "bust".
# - Loop this program until there are no cards left in the deck.

value = 0

marks = ["♠", "♥", "♦", "♣"]
numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []
hands = []
values = []

numbers.each { |number|
marks.each { |mark|
	card = number + mark
	deck.push(card)
}
}

until deck.length == 0 
	3.times {
		random_card = deck.sample
		hands << random_card
		deck.delete(random_card)
	}	

	puts "Choices are #{hands}"

	hands.each { |hand|
		case hand.chr
		when "A"
			value += 1
		when "2"
			value += 2
		when "3"
			value += 3
		when "4"
			value += 4
		when "5"
			value += 5
		when "6"
			value += 6
		when "7"
			value += 7
		when "8"
			value += 8
		when "9"
			value += 9
		else
			value += 10
		end
	}

	if value > 21
		puts "Bust!"
	else
		puts "Point is #{value}"
	end

	hands.clear
	value = 0
end




# s-----

# n = 0
# m = 0
# f = 0

# deck = []
# marks = ["♠", "♥", "♦", "♣"]
# numbers = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
# face_cards = ["J", "Q", "K"]

# while m < marks.length
# 	while n < numbers.length
# 		deck << numbers[n] + marks[m]
# 		n += 1
# 	end
# 	while f < face_cards.length
# 		deck << face_cards[f] + marks[m]
# 		f += 1
# 	end
# 	if f == face_cards.length
# 			f = 0
# 	end
# 	if n == numbers.length
# 			n = 0
# 	end
# 	m += 1
# end

# deck = deck.flatten

# i = 0

# while i < deck.length
# if deck[i].include?("A")
# 	deck[i] = 1
# elsif deck[i].include?("2")
# 	deck[i] = 2
# elsif deck[i].include?("3")
# 	deck[i] = 3
# elsif deck[i].include?("4")
# 	deck[i] = 4
# elsif deck[i].include?("5")
# 	deck[i] = 5
# elsif deck[i].include?("6")
# 	deck[i] = 6
# elsif deck[i].include?("7")
# 	deck[i] = 7
# elsif deck[i].include?("8")
# 	deck[i] = 8
# elsif deck[i].include?("9")
# 	deck[i] = 9
# elsif deck[i].include?("10")
# 	deck[i] = 10
# elsif deck[i].include?("J")
# 	deck[i] = 10
# elsif deck[i].include?("Q")
# 	deck[i] = 10
# elsif deck[i].include?("K")
# 	deck[i] = 10
# end
# end