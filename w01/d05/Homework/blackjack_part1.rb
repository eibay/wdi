###Part 1
# - Create an array with all the cards in a deck (2-10, J, Q, K A)
# - **Don't** explicitly just write out an array with 52 cards
#   - You can write out a smaller array and then generate the rest
# - Output the array of cards
# ------

hand_value = 0  

marks = ["♠", "♥", "♦", "♣"]
numbers = [ "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []
hand = []

numbers.each { |number|
marks.each { |mark|
	card = number + mark
	deck.push(card)
}
}

print deck