
#Add items to the trunk
#Be prevented from adding more than 6 items
#Recieve a warning saying "Trunk is full" when attempting to add a 7th item.

trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

index = 0

puts "How many items would you like to add?"
items = gets.chomp.to_i

while trunk != items && index < 7
	puts trunk[index] 
	if trunk == 6
		puts "There is no more room!"
	else trunk < 6
		puts "You may add more items!"

index = index + 1

end
end


