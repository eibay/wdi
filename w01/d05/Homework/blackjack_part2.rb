###Part 2
# - Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
# - To calculate the value of a hand of cards:
#   - 2-10 have the value of their number
#   - All face cards have the value of 10
#   - Ace is 1

hand_value = 0
i = 0

marks = ["♠", "♥", "♦", "♣"]
numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []
hands = []
value = 0

numbers.each { |number|
marks.each { |mark|
	card = number + mark
	deck.push(card)
}
}

2.times {
	hands << deck.sample
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

puts "Point is #{value}"