#Part 1
base = %w(2 3 4 5 6 7 8 9 10 J Q K A) #creates an array
cards = []


index = 0
while index < base.length # 12 cards
	 cards << card = base[index] + '♥' #gets from searching unicode
	 cards << card = base[index] + '♣'
	 cards << card = base[index] + '♠'
	 cards << card = base[index] + '♦'
	index += 1
end

prints cards	
