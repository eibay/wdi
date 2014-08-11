cards = [*2..10, "J", "Q", "K", "A"]
suits = ["♠", "♥", "♦", "♣"]


deck = []

suits.each { |suit|
cards.each {|card|
deck.push(suit.to_s + card.to_s)

}
}
print deck 


# Part 1

# Create an array with all the cards in a deck (2-10, J, Q, K A)
# Don't explicitly just write out an array with 52 cards
# You can write out a smaller array and then generate the rest
# Output the array of cards