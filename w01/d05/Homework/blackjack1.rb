cardNum = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
deck = []

cardNum.each { |cardNum| 
	
	suits.each { |suits| card = cardNum + " of " + suits 
deck.push(card) 
}
}
puts deck









