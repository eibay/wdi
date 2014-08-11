require 'socket'

server = TCPServer.new 2000
client = server.accept

cards = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["♤", "♡", "♢", "♧"]

deck = []

suits.each do |symbol|
	cards.each do |value|
	card = "#{value} of #{symbol}"
	deck << card
	end
end


game = 0


while game < deck.length

	card_value01 = 0
	card_value02 = 0
	
	card_picked01 = deck.sample
	card_picked02 = deck.sample
	
	
	if card_picked01.split(" ")[0][0] == "K" || card_picked01.split(" ")[0][0] == "Q" || card_picked01.split(" ")[0][0] == "J" 
		card_value01 += 10
		deck.delete(card_picked01)
	elsif card_picked01.split(" ")[0][0] == "A"
		card_value01 += 1
		deck.delete(card_picked01)
	else
		card_value01 += card_picked01.split(" ")[0].to_i
		deck.delete(card_picked01)
	end


	if card_picked02.split(" ")[0][0] == "K" || card_picked02.split(" ")[0][0] == "Q" || card_picked02.split(" ")[0][0] == "J" 
		card_value02 += 10
		deck.delete(card_picked02)
	elsif card_picked02.split(" ")[0][0] == "A"
		card_value02 += 1
		deck.delete(card_picked02)
	else
		card_value02 += card_picked02.split(" ")[0].to_i
		deck.delete(card_picked02)
	end


	hand_p1 = card_value01 + card_value02

	puts "You were delt the #{card_picked01} and the #{card_picked02}."
	puts "You're hand is worth #{hand_p1}"



	card_value04 = 0
	card_value05 = 0
	
	card_picked04 = deck.sample
	card_picked05 = deck.sample
	
	
	if card_picked04.split(" ")[0][0] == "K" || card_picked04.split(" ")[0][0] == "Q" || card_picked04.split(" ")[0][0] == "J" 
		card_value04 += 10
		deck.delete(card_picked04)
	elsif card_picked04.split(" ")[0][0] == "A"
		card_value04 += 1
		deck.delete(card_picked04)
	else
		card_value04 += card_picked04.split(" ")[0].to_i
		deck.delete(card_picked04)
	end


	if card_picked05.split(" ")[0][0] == "K" || card_picked05.split(" ")[0][0] == "Q" || card_picked05.split(" ")[0][0] == "J" 
		card_value05 += 10
		deck.delete(card_picked05)
	elsif card_picked05.split(" ")[0][0] == "A"
		card_value05 += 1
		deck.delete(card_picked05)
	else
		card_value05 += card_picked05.split(" ")[0].to_i
		deck.delete(card_picked05)
	end


	hand_p2 = card_value04 + card_value05

	client.puts "You were delt the #{card_picked04} and the #{card_picked05}."
	client.puts "You're hand is worth #{hand_p2}"
	

	while hand_p1 < 21 

	card_picked03 = deck.sample

	card_value03 = 0


		if card_picked03.split(" ")[0][0] == "K" || card_picked03.split(" ")[0][0] == "Q" || card_picked03.split(" ")[0][0] == "J" 
			card_value03 += 10
			deck.delete(card_picked03)
		elsif card_picked03.split(" ")[0][0] == "A"
			card_value03 += 1
			deck.delete(card_picked03)
		else
			card_value03 += card_picked03.split(" ")[0].to_i
			deck.delete(card_picked03)
		end

		
		puts "Will you stay or hit?"
		choice = gets.chomp.downcase
		puts "\n------------------------"

		if choice == "hit me"
			hand_p1 += card_value03
			puts "You were delt the #{card_picked03}"
			puts "Your hand is now worth #{hand_p1}."
		elsif choice == "stay"
			puts "You stay with #{hand_p1}, onto the next hand."
			break
		end
	end


	if hand_p1 > 21
		puts "BUST"
	end

	if hand_p1 == 21
		puts "Blackjack"
	end


	while hand_p2 < 21

		card_picked06 = deck.sample

		card_value06 = 0


		if card_picked06.split(" ")[0][0] == "K" || card_picked06.split(" ")[0][0] == "Q" || card_picked06.split(" ")[0][0] == "J" 
			card_value06 += 10
			deck.delete(card_picked06)
		elsif card_picked06.split(" ")[0][0] == "A"
			card_value06 += 1
			deck.delete(card_picked06)
		else
			card_value06 += card_picked06.split(" ")[0].to_i
			deck.delete(card_picked06)
		end

		
		client.puts "Will you stay or hit?"
		choice_p2 = gets.chomp.downcase
		client.puts "\n------------------------"

		if choice_p2 == "hit me"
			hand_p2 += card_value06
			client.puts "You were delt the #{card_picked06}"
			client.puts "Your hand is now worth #{hand_p2}."
		elsif choice_p2 == "stay"
			client.puts "You stay with #{hand_p2}, onto the next hand."
			break
		end

		if hand_p2 > 21
			client.puts "BUST"
		end

		if hand_p2 == 21
			client.puts "Blackjack"
		end
	end


	if hand_p1 && hand_p2 > 21
		puts "Both players busted."
		client.puts "Both players busted."
	elsif hand_p1 && hand_p2 == 21
		puts "Both players got Blackjack."
		client.puts "Both players got Blackjack."
	elsif hand_p1 > 21
		puts "BUST"
		client.puts "You win, Player 1 busted."
	elsif hand_p1 == 21
		puts "Blackjack"
		client.puts "Player 1 got Blackjack."
	elsif hand_p2 > 21
		client.puts "BUST"
		puts "You win, Player 2 busted."
	elsif hand_p2 == 21
		client.puts "Blackjack"
		puts "Player 2 got Blackjack."
	end


	game += 1

	puts "\n------------------------"
	client.puts "\n------------------------"
end


puts "Deck out, thanks for playing."
client.puts "Deck out, thanks for playing."
client.close





