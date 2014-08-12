

base = %w(1 2 3 4 5 6 7 8 9 10 J Q K A)
cards = []
index = 0
while index< base.length
	cards << base[index] + ' hearts'
	cards << base[index] + ' clubs'
	cards << base[index] + ' diamonds'
	cards << base[index] + ' spades'
	index +=1
end

print cards