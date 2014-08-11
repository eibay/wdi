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

	value += value

	if value > 22
		puts "Bust!"
	else
		puts "Point is #{value}"
		value = 0
	end

	hands.clear
	value = 0
end