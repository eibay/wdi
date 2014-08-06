trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

i = 0

while trunk.length <= 5
	trunk.push(items[i])
	print trunk
	puts ""
	i += 1
	if trunk.length > 5
		puts "TRUNK IS FULL!!!"
	end
end
