suits = ["D", "C", "H", "S"]
ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []

#creates the deck
suits.each do |x|
	ranks.each do |y|
		deck.push(y + x)
	end
end

while deck.length > 1
	def deal_3_cards(cards)
		hand = []
		3.times do 
			card = cards.sample
			hand.push(card)
			cards.delete(card)
		end
		return hand
	end

	player_hand = deal_3_cards(deck)

	def calc_card(card)
		if card[0].to_i > 1 && card[0].to_i <= 9
			card_val = card[0].to_i
		elsif card[0] == "A"
			card_val = 1
		else
			card_val = 10
		end
	end
			
	def calc_val(hand)
		hand_value = 0
		hand.each do |x|	
			hand_value += calc_card(x)
		end 
		return hand_value
	end


	if calc_val(player_hand) > 21 then puts "Bust!" end
	puts "Your hand is #{player_hand} with the total value #{calc_val(player_hand)}"
	puts "----------" 
end

puts "Only #{deck.length} card left in the deck."