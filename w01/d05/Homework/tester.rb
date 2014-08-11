require 'pry'

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

puts "shuffled cards------------"
print shuffled_cards


def card_value(dealt_card)
	if dealt_card.split[0] == "A"
		c_value = 1

	elsif dealt_card.split[0] == "J" || dealt_card.split[0] == "Q" || dealt_card.split[0] == "K"
		c_value = 10

	else
		c_value = dealt_card.split[0]
	end
end

while shuffled_cards.length >= 3
	puts " "
	card_1 = shuffled_cards[rand(52)]
	puts card_1
	card_1_value = card_value(card_1)
	puts card_1_value
	shuffled_cards.delete(card_1)

	puts " "
	card_2 = shuffled_cards[rand(52)]
	puts card_2
	card_2_value = card_value(card_2)
	puts card_2_value
	shuffled_cards.delete(card_2)

	puts " "
	card_3 = shuffled_cards[rand(52)]
	puts card_3
	card_3_value = card_value(card_3)
	puts card_3_value
	shuffled_cards.delete(card_3)

	puts " "
	total = card_1_value + card_2_value + card_3_value
	puts "total"
	puts total

	if total > 21
		puts "oops, sorry you lose"
	end
end

puts "Sorry, not enough cards left, go home!"
puts shuffled_cards




