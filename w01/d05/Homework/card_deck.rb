#PART 1
# cards included in deck:
# (2-10, J, Q, K, A)
#suits: (Spades, Hearts, Diamonds, Clubs)

def generate_deck()
	deck = []
	suits = ["♠︎", "♥︎", "♦︎", "♣︎"]
	cards = (2..10).to_a + ["Jack", "King", "Queen", "Ace"].flatten

	cards.each do |card|
		suits.each do |suit|
			deck << [card, suit]
		end
	end #.flatten
	#return deck
	return deck
	#puts deck.length
end
generate_deck()

# Same thing probably would have been better as a hash
# makes it better 
# [
# 	{suit: "hearts", card: "jack"},
# 	{suit: "hearts", card: "ace"},
# 	{suit: "hearts", card: "king"},
# ]
 
# puts
# puts deck.length
