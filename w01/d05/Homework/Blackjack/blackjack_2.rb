total_hand = 0

suits = [ "_C", "_H", "_S", "_D"]
pips = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []
hand = []

# create deck
pips.each { |p|
	suits.each { |s|
	card = p + s 
	deck.push(card) 
	}
}

#create hand
#choose 2 cards at random, populate hand with them, delete from deck
deck = deck.shuffle
2.times {hand.push deck.delete_at(0)}
puts hand

#calculate total value of hand
def hand_calc(hand) 
	whichcard = 0
	hand_value = 0  
	hand.each { |item| 
		case hand[whichcard].chr
		when "A"
		hand_value += 1
		when "2"
		hand_value += 2
		when "3"
		hand_value += 3
		when "4"
		hand_value += 4
		when "5"
		hand_value += 5
		when "6"
		hand_value += 6
		when "7"
		hand_value += 7
		when "8"
		hand_value += 8
		when "9"
		hand_value += 9
		else
		hand_value += 10
		end
	whichcard += 1
	}
	return hand_value
end
total_hand = hand_calc(hand)

puts "This hand is #{total_hand} points."