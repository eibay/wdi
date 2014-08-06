trunk = []
items = ["Gloves", "Shovel", "Bag", "Shoes", "Tire", "Food", "Drinks", "Clothes"]

space = 0

while space <= 6
	trunk.push(items[space])
	space = space + 1

	if space > 6 
		puts "Nope, trunk is full..."
	else
		puts "Surely we can fit more than #{trunk}"
	end

end

puts "The trunk now has #{trunk} in it."

	 
