
suits = [ "spades", "hearts", "clubs", "diamonds"]
value = ["J", "Q", "K", "A"]
cards_array = []


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

card_1 = cards_array[rand(0..51)]
puts card_1
card_1_value = card_1.split(" ")[0]
card_2 = cards_array[rand(0..51)]
puts card_2
card_2_value = card_2.split(" ")[0]


def card_value(card_value)
	if card_value == "J" || card_value == "Q" || card_value == "K" || card_value == "A"
		return 10
	
	else 
		return card_value.to_i
	end
end



sum = card_value(card_1_value) + card_value(card_2_value)
 
puts sum



