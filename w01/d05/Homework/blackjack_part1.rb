# BLACKJACK PART 1

require 'pry'
suits = [ "spades", "hearts", "clubs", "diamonds"]
value = ["J", "Q", "K", "A"]
cards_array = []


# FOR FACE CARDS
x = 0
while x < value.length
 
	def card (value, suit, array)
		array.push(value + " " + suit)
	end

		i = 0
		while i < suits.length
			card(value[x], suits[i], cards_array)
			i += 1
		end

x += 1
end


# FOR NUMBERED CARDS
x = 2
while x < 11
 
	def card (value, suit, array)
		array.push(value + " " + suit)
	end

		i = 0
		while i < suits.length
			card(x.to_s, suits[i], cards_array)
			i += 1
		end
x += 1
end


puts cards_array
 