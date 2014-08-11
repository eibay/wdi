require './card'

deck = []

(0..3).each do |suit|
	(1..13).each do |rank|
		deck << Card.new(rank, suit)
	end
end

while deck.size >= 2
	hand = deck.sample(2)
	deck = deck - hand
	value = hand[0].value + hand[1].value

	while true
		description = hand.join("\n")

		puts "\nYour hand is: #{description}"
		puts "Value: #{value}"

		if value > 21
			puts "Sorry! The hand is bust!"
			break
		end

		print 'Hit or stay? Type "Hit me" to hit, or "Stay" to stay. '
		option = gets.chomp

		if option == "Stay"
			break
		elsif option == "Hit me"
			if deck.size == 0
				puts "Oh no! The deck is out of cards. Sorry!"
				break
			end
			new_card = deck.sample
			deck.delete(new_card)
			value += new_card.value
			puts "You were dealt a #{new_card}!"
		end
	end
end