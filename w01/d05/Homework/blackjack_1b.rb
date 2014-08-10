# array[][].push()
# question--How to push into multi-dimensional array?
# cards[counter_suit].push(sequence[counter_seq] + " " + suit)



suits = ["diamond", "heart", "spade", "club"]
sequence = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
cards = []

counter_suit = 0

while counter_suit < suits.length
	sequence.each do |seq|
		cards.push("#{seq} #{suits[counter_suit]}")
	end
	counter_suit += 1
end

print cards