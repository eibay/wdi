trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
trunk_count = 0  #number of items in the trunk, also = to indices in items array.

while trunk_count <= 6
	puts("Would you like to add a #{items[trunk_count]}? (yes or no)")
	ans = gets.chomp.downcase
		if (ans == "yes") && (trunk_count <6)
		trunk.push(items[trunk_count])
		puts("You added #{items[trunk_count]} to the trunk.")
		trunk_count += 1
		elsif ans == "no"
			puts("Worn out already?")
			trunk_count = 7
		elsif (ans != "yes") && (ans != "no")
			puts("Please try again.")
		else
			puts("Sorry, the trunk is full!")
			trunk_count = 7
	end
end


