base = %w(2 3 4 5 6 7 8 9 10 J Q K A)
cards = []

index = 0
while index < base.length
	cards << base[index] + ' ♥'
	cards << base[index] + ' ♣'
	cards << base[index] + ' ♠'
	cards << base[index] + ' ♦'
	index += 1
end

print cards
puts "" #new line
