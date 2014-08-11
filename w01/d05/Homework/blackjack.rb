# Part 1

cards = ["A", *2..10, "J", "Q", "K"]
suits = ["♠", "♥", "♦", "♣"]

deck = []
suits.each do |suit| 
	cards.each do |card| 
	deck.push("#{card}#{suit}")
	end
	end
print deck

# Part 2
"J" = 10
"Q" = 10
"K" = 10
"A" = 1 
hand = []
	card_a = deck.sample
	hand.push(card_a)
	deck_reduced = deck.select {|a| a != card_a}
	card_b = deck_reduced.sample
	hand.push(card_b)

hand_value = []
n = 0
while n < hand.length
	hand_value.push(hand[n].split(""))
	if hand_value[n][1]
	n += 1
end
	 
hand_value

puts hand_value


	

