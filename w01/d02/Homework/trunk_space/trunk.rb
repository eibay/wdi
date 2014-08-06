
#Add items to the trunk
#Be prevented from adding more than 6 items
#Recieve a warning saying "Trunk is full" when attempting to add a 7th item.

trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

index = 0

puts "How many items would you like to add?"
things = gets.chomp.to_i

while index < 7
	things = items.shuffle.sample
	trunk << items
	if index < 6
		puts "You added #{things} in your trunk"
		items.delete(things)
	else 
		puts "Trunk is full!"
end
 index = index + 1
end


