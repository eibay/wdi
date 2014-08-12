# this is how Jill populated the card deck
# suits = ["diamond", "heart", "spade", "club"]
# sequence = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
# cards = []

# counter_suit = 0

# while counter_suit < suits.length
# sequence.each do |seq|
# cards.push("#{seq} #{suits[counter_suit]}")
# end
# counter_suit += 1
# end


#OPTION FROM SEAN - WITHOUT DOING A SUITS ARRAY
sequence = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
cards = []

index = 0
while index<sequence.length 
	cards << sequence[index] + "♠" #for the 2 cards (since they are at [0])
	cards << sequence[index] + "♥" 
	cards << sequence[index] + "♦" 
	cards << sequence[index] + "♣" 
	index += 1
end

puts cards

#to get the value of the card (now that it has a suit attached to it),
#use .split method

card = "2♥"
card.last

