require './card'

deck = []

(0..3).each do |suit|
	(1..13).each do |rank|
		deck << Card.new(rank, suit)
	end
end

while deck.size >= 3 do
	hand = deck.sample(3)
	deck = deck - hand

	description = hand.join("\n")
	value = hand[0].value + hand[1].value + hand[2].value

	puts "\nYour hand is:\n#{description}"
	puts "Value: #{value}"
	puts "Sorry, your hand is a bust!" if value > 21
end