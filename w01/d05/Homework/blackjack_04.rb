require 'pry'

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


	hand = card_value01 + card_value02

	puts "You were delt the #{card_picked01} and the #{card_picked02}."
	puts "You're hand is worth #{hand}"
	
	
	while hand < 21

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
			hand += card_value03
			puts "You were delt the #{card_picked03}"
			puts "Your hand is now worth #{hand}."
		elsif choice == "stay"
			puts "You stay with #{hand}, onto the next hand."
			break
		end
	end


	if hand > 21
		puts "BUST"
	end

	if hand == 21
		puts "Blackjack"
	end


	game += 1

	puts "\n------------------------"
end


puts "Deck out, thanks for playing."





