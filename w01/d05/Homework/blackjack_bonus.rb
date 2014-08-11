require 'socket'
require 'pry'

server1 = TCPServer.new 2001
server2 = TCPServer.new 2002
player1 = server1.accept
player2 = server2.accept

suits = ["D", "C", "H", "S"]
ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []

#creates the deck
suits.each do |x|
	ranks.each do |y|
		deck.push(y + x)
	end
end

wins = {player1_wins: 0, player2_wins: 0, dealer_wins: 0}

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

	player1_play = true
	player2_play = true
	dealer_play = true
	score = {player1_score: 0, player2_score: 0, dealer_score: 0}
	wins.each {|x| player1.puts "#{x}"}
	wins.each {|x| player2.puts "#{x}"}
	wins.each {|x| puts "#{x}"}
	player1.puts "YOU ARE PLAYER 1"
	player2.puts "YOU ARE PLAYER 2"
	puts "YOU ARE DEALER"
	
	

	# Player1
	player1_hand = [deal(deck), deal(deck)]
	while player1_play
		player1.puts "Your hand #{player1_hand}"
		player2.puts "Player1 hand #{player1_hand}"
		puts "Player1 hand #{player1_hand}"
		player1.puts "Hit or Stay?"
		player_choice = player1.gets.chomp.downcase
		if player_choice.include?("hit")
			player1_hand.push(deal(deck))
			score[:player1_score] = calc_val(player1_hand)
			if score[:player1_score] > 21
				player1.puts "Your hand #{player1_hand} Bust!"
				player2.puts "Player1 busts."
				puts "Player1 busts."
				player1_play = false
			end
		elsif player_choice.include?("stay")
			score[:player1_score] = calc_val(player1_hand)
			player1.puts "Your hand = #{score[:player1_score]}"
			player2.puts "Player1 hand = #{score[:player1_score]}"
			puts "Player1 hand = #{score[:player1_score]}"
			player1_play = false
		end
	end

	# Player2
	player2_hand = [deal(deck), deal(deck)]
	while player2_play
		player2.puts "Your hand #{player2_hand}"
		puts "Player2 hand #{player2_hand}"
		player2.puts "Hit or Stay?"
		player_choice = player2.gets.chomp.downcase
		if player_choice.include?("hit")
			player2_hand.push(deal(deck))
			score[:player2_score] = calc_val(player2_hand)
			if score[:player2_score] > 21 
				player2.puts "Your hand #{player2_hand} Bust!"
				player1.puts "Player2 busts."
				puts "Player2 busts."
				player2_play = false
			end
		elsif player_choice.include?("stay")
			score[:player2_score] = calc_val(player2_hand)
			player2.puts "Your hand = #{score[:player2_score]}"
			player1.puts "Player2 hand = #{score[:player2_score]}"
			puts "Player2 hand = #{score[:player2_score]}"
			player2_play = false
		end
	end

	# Dealer plays unless both players have already busted
	if score[:player1_score] > 21 && score[:player2_score] > 21
		dealer_play = false
		wins[:dealer_wins] += 1
		puts "You win!\n----------"
		player1.puts "Dealer wins!\n----------"
		player2.puts "Dealer wins!\n----------"
	elsif score[:player1_score] <= 21 && score[:player2_score] <= 21
		while dealer_play 
			puts "Your hand #{dealer_hand}"
			player1.puts "Dealer hand #{dealer_hand}"
			player2.puts "Dealer hand #{dealer_hand}"
			puts "Hit or Stay?"
			dealer_choice = gets.chomp.downcase
			if dealer_choice.include?("hit")
				dealer_hand.push(deal(deck))
				if calc_val(dealer_hand) > 21 
					puts "Your hand = #{dealer_hand} Bust!"
					player1.puts "Dealer busts."
					player2.puts "Dealer busts."
					dealer_play = false
				end
			elsif dealer_choice.include?("stay")
				score[:dealer_score] = calc_val(dealer_hand)
				puts "Your hand = #{score[:dealer_score]}"
				player1.puts "Dealer hand = #{score[:dealer_score]}"
				player2.puts "Dealer hand = #{score[:dealer_score]}"
				dealer_play = false
			end
		end
	end

	if score[:player1_score] <= 21 && score[:player1_score] > score[:player2_score] && score[:player1_score] > score[:dealer_score]
		wins[:player1_wins] += 1
		player1.puts "You win!\n----------"
		player2.puts "Player1 wins!\n----------"
		puts "Player1 wins!\n----------"
	elsif score[:player2_score] <= 21 && score[:player2_score] > score[:player1_score] && score[:player2_score] > score[:dealer_score]
		wins[:player2_wins] += 1
		player2.puts "You win!\n----------"
		player1.puts "Player2 wins!\n----------"
		puts "Player2 wins!\n----------"
	elsif score[:dealer_score] <= 21 && score[:dealer_score] > score[:player1_score] && score[:dealer_score] > score[:player2_score]
		wins[:dealer_wins] += 1
		puts "You win!\n----------"
		player1.puts "Dealer wins!\n----------"
		player2.puts "Dealer wins!\n----------"
	elsif score[:player1_score] <= 21 && score[:player1_score] == score[:player2_score] && score[:player1_score] > score[:dealer_score]
		wins[:player1_wins] += 1
		wins[:player2_wins] += 1
		player1.puts "You tie with Player2\n----------"
		player2.puts "You tie with Player1\n----------"
		puts "Player1 & Player2 tie, you lose\n----------"
	elsif score[:player2_score] <= 21 && score[:player2_score] == score[:player1_score] && score[:player2_score] > score[:dealer_score]
		wins[:player1_wins] += 1
		wins[:player2_wins] += 1
		player1.puts "You tie with Player2\n----------"
		player2.puts "You tie with Player1\n----------"
		puts "Player1 & Player2 tie, you lose\n----------"
	elsif score[:dealer_score] <= 21 && score[:dealer_score] == score[:player1_score] && score[:dealer_score] > score[:player2_score]
		wins[:player1_wins] += 1
		wins[:dealer_wins] += 1
		player1.puts "You tie with Dealer\n----------"
		player2.puts "Player1 & Dealer tie, you lose\n----------"
		puts "You tie with Player1\n----------"
	elsif score[:dealer_score] <= 21 && score[:dealer_score] == score[:player2_score] && score[:dealer_score] > score[:player1_score]
		wins[:player2_wins] += 1
		wins[:dealer_wins] += 1
		player2.puts "You tie with Dealer\n----------"
		player1.puts "Player1 & Dealer tie, you lose\n----------"
		puts "You tie with Player2\n----------"
	elsif score[:dealer_score] <= 21 && score[:dealer_score] == score[:player2_score] && score[:dealer_score] == score[:player1_score]
		wins[:player1_wins] += 1
		wins[:player2_wins] += 1
		wins[:dealer_wins] += 1
		player2.puts "Holy smokes a 3 way tie!!!\n----------"
		player1.puts "Holy smokes a 3 way tie!!!\n----------"
		puts "Holy smokes a 3 way tie!!!\n----------"	
	end
end
player1.puts "Out of cards. GAME OVER"
player2.puts "Out of cards. GAME OVER"
puts "Out of cards. GAME OVER"