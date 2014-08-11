require 'pry'
#Part 2

# load 'card_deck.rb'

# deck = generate_deck()
# random_card = deck[(rand() * 52).to_i]

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
#binding.pry

puts

puts "Total value of hand is: #{value}"



# unless card1[0] == "Ace"
# 		puts "Value is 1"
# 	end
# if card1[0].class == String
# 	print card1
# 	puts
	
# 	puts "Value is 10"
# else 
# 	print card1
# 	puts
# 	puts "Value is #{card1[0]}"
# end

# if card2[0].class == String
# 	print card2
# 	puts
# 	if card2[0] == "Ace"
# 		puts "Value is 1"
# 	end
# 	puts "Value is 10"
# else 
# 	print card2
# 	puts
# 	puts "Value is #{card2[0]}"
# end


# print card1
# puts 
# print card2

# if (2..10).include? card1[0]
# 	value = card1[0]
# 	puts value
# elsif 

#puts "#{card1} "+" #{card2}"
