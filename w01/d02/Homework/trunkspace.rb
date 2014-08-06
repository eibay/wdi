trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

index = 0

while trunk.length <= 5
	trunk.push(items[index])
	index += 1
	unless index <= 5
		puts "Trunk is full"
	
	end
	
end

puts trunk