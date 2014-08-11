suits = [ "c", "h", "s", "d"]
pips = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []

# create your deck of cards
pips.each { |p|
	suits.each { |s|
		card = p + s 
	deck.push(card)	
	}
}

print deck
print deck.length

