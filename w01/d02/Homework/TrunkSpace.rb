trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

trunk_count = 0

while trunk_count <= 6
	puts("Want to put #{items[trunk_count]}? (yes or no)")
	ans = gets.chomp.downcase
			if (ans == "yes") && (trunk_count <6)
			trunk.push(items[trunk_count])
			puts("#{items[trunk_count]} has been added to the trunk!!!!")
			trunk_count += 1
			elsif ans == "no"
					puts("OK!!!!")
					trunk_count =  7
			elsif (ans != "yes") && (ans != "no")
					puts("BUMMER!")
			else
					puts("No more items can be added to the trunk")
					trunk_count = 7
	end
end

