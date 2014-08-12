#Part 1
cards = %w (A 2 3 4 5 6 7 8 9 10 J Q K) 
# '%w' turns the items inside the parentheses into an array of strings
suits = ["♠", "♥", "♦", "♣"]

deck = []
suits.each do |suit| 
	cards.each do |card| 
	deck << ("#{card}#{suit}")
	# '<<' pushes the thing to the right into the deck array
	end
	end