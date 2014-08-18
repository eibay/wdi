marks = ["♠", "♥", "♦", "♣"]
cards = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
deck = []

i = 0

cards.each do |card|
	marks.each do |mark|
		trump = card + mark
		deck << trump
	end
end

random_cards = []

2.times do
	random_card = deck.sample
	random_cards << random_card
end

puts random_cards
