# The 2 methods work but there is no loop yet to deal out of the deck again.

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
puts deck.length

#create hand
#choose 3 cards at random, populate hand with them, delete from deck
shuffled_deck = deck.shuffle

def deal(hand, shuffled_deck) 
	3.times {hand.push shuffled_deck.delete_at(0)}
	return hand, shuffled_deck
end
hand, shuffled_deck = deal(hand, shuffled_deck)
puts hand
puts shuffled_deck.length

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

if total_hand > 21
	puts "This hand is #{total_hand} points. BUST!"
elsif total_hand == 21
	puts "TWENTY-ONE!"
else
	puts "This hand is #{total_hand} points."
end

# puts "Go again."