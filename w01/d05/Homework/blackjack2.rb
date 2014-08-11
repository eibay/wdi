#Part 3
load 'card_deck.rb'
require 'pry'
# def random_card
# 	load 'card_deck.rb'
# 	deck = generate_deck()
# 	rand_card = deck[(rand() * 52).to_i]
# end

deck = generate_deck()
random_card = deck[(rand() * 52)] 
deck_index = 0

while deck_index < deck.length
	random = rand(52)
	card1 = deck.delete_at(random_card)     
	card2 = deck.delete_at(random_card)     
	card3 = deck.delete_at(random_card)   
	cards = [card1, card2, card3]
	print cards
	puts
	index = 0
	value = 0
	while index < cards.length
		card = cards[index][0]
		
		if card == "Ace"
			puts "Value is 1"
			value += 1
		elsif (2..10).include? card
			puts "Value is #{card}"
			value += card
		else
			puts "Value is 10"
			value += 10
		end
		 index += 1
	end

	puts

	puts "Total value of hand is: #{value}"

	if value > 21
		puts "Bust!"
	end
	puts
	puts "Deal again? [y] [n]"
	input = gets.chomp.downcase
	if input == 'y'
		deck_index += 1
	else
		break
	end
end



