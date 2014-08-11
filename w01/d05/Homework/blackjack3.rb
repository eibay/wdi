require 'pry'
cardNum = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
deck = []
hand = []
card = []
handVal = 0
inhand = []

cardNum.each { |cardNum| 
	
	suits.each { |suits| card = cardNum + " of " + suits 
deck.push(card) 
}
}

deck = deck.shuffle


def deal (deck, hand, handVal)
	hand.push(deck[0])
	deck.delete_at(0)
	thiscard = hand.length - 1

	if hand[thiscard][0] == "A" 
		cardVal = 1
	elsif (hand[thiscard][0] == "1") || (hand[thiscard][0] == "J") || (hand[thiscard][0] == "Q") || (hand[thiscard][0] == "K")
		cardVal = 10
	else cardVal = hand[thiscard][0].to_i
	end

	handVal = handVal + cardVal
	return hand, handVal, deck
end
while deck.length >= 3
	inhand,handVal,deck = deal(deck, hand, handVal) 
	inhand,handVal,deck = deal(deck, hand, handVal)
	inhand,handVal,deck = deal(deck, hand, handVal) 
	puts("Your hand of #{hand[0]}, #{hand[1]}, and #{hand[2]} totals #{handVal}.")
	if handVal < 22
		puts("Alright!")
	else
		puts("Busted.")
	end
	3.times { hand.delete_at(0) }

	handVal = 0
end
if deck.length == 1
	puts("There's only #{deck.length} card left.  Good game!")
else puts("There's only #{deck.length} cards left.  Good game!")
end






