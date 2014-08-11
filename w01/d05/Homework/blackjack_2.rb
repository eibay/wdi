# array[][].push()
# question--How to push into multi-dimensional array?
# cards[counter_suit].push(sequence[counter_seq] + " " + suit)


suits = ["diamond", "heart", "spade", "club"]
sequence = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
cards = []

counter_suit = 0

while counter_suit < suits.length
	sequence.each do |seq|
		cards.push("#{seq} #{suits[counter_suit]}")
	end
	counter_suit += 1
end

shuffled_cards = cards.shuffle

print shuffled_cards

puts " "
puts "1st card dealt"


deal_a_card_1 = shuffled_cards[rand(52)]
puts deal_a_card_1

if deal_a_card_1.split[0] == "A"
	value_1 = 1

elsif deal_a_card_1.split[0] == "J" || deal_a_card_1.split[0] == "Q" || deal_a_card_1.split[0] == "K"
	value_1 = 10

else
	value_1 = deal_a_card_1.split[0].to_i

end


puts "2nd card dealt"

deal_a_card_2 = shuffled_cards[rand(52)]
puts deal_a_card_2

if deal_a_card_2.split[0] == "A"
	value_2 = 1

elsif deal_a_card_2.split[0] == "J" || deal_a_card_2.split[0] == "Q" || deal_a_card_2.split[0] == "K"
	value_2 = 10

else
	value_2 = deal_a_card_2.split[0].to_i

end


puts "hand total"

hand_value = value_1 + value_2
puts hand_value



# 	#create a hash that has a card(key) and its value

# 	cards_values = {
# 		each cards |
# 	}
