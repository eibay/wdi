require 'pry'

cards = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
suits = ["♤", "♡", "♢", "♧"]


# hash = {
# 	"Ace" => 1,
# 	"2" => 2,
# 	# cards[2] => 3
# 	# cards[3] => 4,
# 	# cards[4] => 5,
# 	# cards[5] => 6,
# 	# cards[6] => 7,
# 	# cards[7] => 8,
# 	# cards[8] => 9,
# 	# cards[9] => 10,
# 	# cards[10] => 10,
# 	# cards[11] => 10,
# 	# cards[12] => 10


deck = []

suits.each do |symbol|
	cards.each do |value|
	card = "#{value} of #{symbol}"
	deck << card
	end
end

print deck

# suits = {
# 	:"♤" => cards, 
# 	:"♡" => cards, 
# 	:"♢" => cards, 
# 	:"♧" => cards
# }
 
