all_cards = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
full_deck = []

all_cards.each { |c|
suits.each { |s|
individual_card = c + " of " + s 
deck.push(individual_card) 
}
}

print deck