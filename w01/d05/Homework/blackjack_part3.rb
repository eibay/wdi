
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



def black_jack(card_value)
	if card_value == "J" || card_value == "Q" || card_value == "K" 
		return 10
	elsif card_value == "A"
		return 1
	else 
		return card_value.to_i
	end
end

until cards_array.length == 1

card_1 = cards_array[rand(0..cards_array.length-1)]
card_1_value = card_1.split(" ")[0]
	puts card_1
	cards_array.delete(card_1)
card_2 = cards_array[rand(0..cards_array.length-1)]
card_2_value = card_2.split(" ")[0]
	puts card_2
	cards_array.delete(card_2)
card_3 = cards_array[rand(0..cards_array.length-1)]	
card_3_value = card_3.split(" ")[0]
	puts card_3
	cards_array.delete(card_3)
	

sum = black_jack(card_1_value) + black_jack(card_2_value) + black_jack(card_3_value)
 
puts sum

if sum > 21
	puts "Bust"
end

end

puts "Out of Cards"




















