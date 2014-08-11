#Part 2

def random_card
	load 'card_deck.rb'
	deck = generate_deck()
	rand_card = deck[(rand() * 52).to_i]

end

card1 = random_card()
card2 = random_card()
cards = [card1, card2]
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


