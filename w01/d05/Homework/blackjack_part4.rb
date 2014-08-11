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
	def deal(cards)
		card = cards.sample
		cards.delete(card)
	end	

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

	# Player is dealt 2 cards
	player_hand = [deal(deck), deal(deck)]
	puts "Your hand #{player_hand}"
	puts "Hit or Stay?"
	choice = gets.chomp.downcase
	if choice.include?("hit")
		player_hand.push(deal(deck))
		puts "Your hand #{player_hand} = #{calc_val(player_hand)}"
		if calc_val(player_hand) > 21 
			puts "Bust!"
		end
	elsif choice.include?("stay")
		puts "Your hand = #{calc_val(player_hand)}"
	end
	puts "----------" 
end

puts "Out of cards. GAME OVER"