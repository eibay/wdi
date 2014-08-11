# Just trying to figure out how to loop through dealing the deck 
# before adding the calculation back in from blackjack_3.

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
#puts deck.length

#create hand
#choose 3 cards at random, populate hand with them, delete from deck
shuffled_deck = deck.shuffle

def deal(hand, shuffled_deck) 
	3.times {hand.push shuffled_deck.delete_at(0)}
	return hand, shuffled_deck
end

while shuffled_deck.length > 1 
	x = 1
	hand, shuffled_deck = deal(hand, shuffled_deck)
	this_hand = hand(x)
	puts shuffled_deck.length
	x += 1
end
