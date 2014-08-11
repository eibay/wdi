# Part 1

base = %w(2 3 4 5 6 7 8 9 10 J Q K A)
cards =[]

index = 0
while index <base.length
	cards << base[index] + ' diamonds'
	cards << base[index] + ' spades'
	cards << base[index] + ' clubs'
	cards << base[index] + ' hearts'
	index += 1
end

print cards

# Part 2



card_one = cards[rand(52)]
card_two = cards[rand(52)].!include?(card_one)

print card_one