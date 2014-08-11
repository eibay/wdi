require './card'

deck = []

(0..3).each do |suit|
	(1..13).each do |rank|
		deck << Card.new(rank, suit)
	end
end

hand = deck.sample(2)
deck = deck - hand

description = hand.join(" and ")
value = hand[0].value + hand[1].value

puts "Your hand is: #{description}"
puts "Value: #{value}" 