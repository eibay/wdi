require 'socket'
require 'pry'

server = TCPServer.new 2000
player = server.accept


suits = ["D", "C", "H", "S"]
ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []

#creates the deck
suits.each do |x|
	ranks.each do |y|
		deck.push(y + x)
	end
end

dealer_wins = 0
player_wins = 0

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

	player_play = true
	dealer_play = true
	player.puts "player wins = #{player_wins}"
	puts "player wins = #{player_wins}"
	player.puts "dealer wins = #{dealer_wins}"
	puts "dealer wins = #{dealer_wins}"

	# Player
	player_hand = [deal(deck), deal(deck)]
	while player_play 
		player.puts "Your hand #{player_hand}"
		puts "Player hand #{player_hand}"
		player.puts "Hit or Stay?"
		player_choice = player.gets.chomp.downcase
		if player_choice.include?("hit")
			player_hand.push(deal(deck))
			if calc_val(player_hand) > 21 
				player.puts "Your hand #{player_hand} Bust! Dealer wins.\n----------"
				puts "Player busts. You win!\n----------"
				player_play = false
				dealer_play = false
				dealer_wins += 1
			end
		elsif player_choice.include?("stay")
			player.puts "Your hand = #{calc_val(player_hand)}"
			puts "Player hand = #{calc_val(player_hand)}"
			player_play = false
		end
	end

	# Dealer plays
	dealer_hand = [deal(deck), deal(deck)]
	while dealer_play 
		puts "Your hand #{dealer_hand}"
		player.puts "Dealer hand #{dealer_hand}"
		puts "Hit or Stay?"
		dealer_choice = gets.chomp.downcase
		if dealer_choice.include?("hit")
			dealer_hand.push(deal(deck))
			if calc_val(dealer_hand) > 21 
				puts "Your hand #{dealer_hand} Bust! Player wins\n----------"
				player.puts "Dealer busts. You win!\n----------"
				dealer_play = false
				player_wins += 1
			end
		elsif dealer_choice.include?("stay")
			puts "Your hand = #{calc_val(dealer_hand)}"
			player.puts "Dealer hand = #{calc_val(dealer_hand)}"
			dealer_play = false
		end
	end

	# And the winner is
	if calc_val(player_hand) <= 21 && calc_val(dealer_hand) <= 21 
		if calc_val(player_hand) > calc_val(dealer_hand)
			player.puts "You win!\n----------"
			puts "You lose.\n----------"
			player_wins += 1
		elsif calc_val(player_hand) == calc_val(dealer_hand)
			player.puts "Tie!\n----------"
		 	puts "Tie!\n----------"
		else
			player.puts "You lose.\n----------"
			puts "You win!\n----------"
			dealer_wins += 1
		end
	end
end
player.puts "Out of cards. GAME OVER"
puts "Out of cards. GAME OVER"