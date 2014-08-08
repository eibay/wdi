# blackjack 1

suits = ["diamond", "heart", "spade", "club"]
sequence = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
cards = []

counter_suit = 0

while counter_suit < suits.length
	counter_seq = 0 # MUST BE INSIDE 1st LOOP OTHERWISE IT WILL BE > SEQUENCE.LENGTH AFTER 1 ITERATION OF THE 2ND LOOP
	suit = suits[counter_suit]
	while counter_seq < sequence.length
		cards.push(sequence[counter_seq] + " " + suit)
		counter_seq += 1
	end
	counter_suit += 1
end

puts cards


