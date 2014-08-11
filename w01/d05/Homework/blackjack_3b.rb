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
puts " "

hand = []

3.times do
	hand.push(shuffled_cards[rand(52)])
end

puts "dealt cards------------"
print hand


def card_values(hand)
	c_values = []
	hand.each do |dealt_card|
		if dealt_card.split[0] == "A"
			c_val = 1

		elsif dealt_card.split[0] == "J" || dealt_card.split[0] == "Q" || dealt_card.split[0] == "K"
			c_val = 10

		else
			c_val = dealt_card.split[0].to_i
		end
		c_values.push(c_val)
	end
	return c_values
	binding.pry
end

puts "dealt card values------------"
binding.pry
puts card_values(hand)


