require './card'

deck = []

(0..3).each do |suit|
	(1..13).each do |rank|
		deck << Card.new(rank, suit)
	end
end

puts deck.join("\n")