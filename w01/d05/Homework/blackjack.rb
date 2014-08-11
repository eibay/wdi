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
			deck << "#{card} #{suit}"
		end
	end.flatten
	return deck
end
# print deck
# puts
# puts deck.length
