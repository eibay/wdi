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

# print deck

card_picked01 = deck.sample
card_picked02 = deck.sample


card_value01 = 0
card_value02 = 0



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

puts "You were delt the #{card_picked01} and the #{card_picked02}"
puts "You're hand is worth #{hand}"



