items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
trunk = []
i = 0
response = "yes"

while i < 6 && response == "yes"
	puts "Would you like to put something in the trunk?"
	response = gets.chomp
	if response == "yes"
		trunk[i] = items[i]
			i += 1
	end
end

if i < 6 && response != "yes"
	puts "In your trunk, you have #{trunk}."
else 
	puts "The trunk is full, man. It has #{trunk}"
end
