trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

index = 0

while trunk.length <=5
	trunk.push(items[index])
	unless index == 5
	index += 1
	end

end
puts trunk

puts "trunk is full"
