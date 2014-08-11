suits = ["D", "C", "H", "S"]
rank = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
deck = []

suits.each do |x|
	rank.each do |y|
		deck.push(y + x)
	end
end

print deck