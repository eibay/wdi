trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

index = 0

puts "Would you like to add an item?"
answer =  gets.chomp.downcase

while 
	index < 6 && answer == "yes"
	trunk.push(items[index])
	index = index + 1 
	if index < 6
		puts "Would you like to add another item?"
		answer = gets.chomp.downcase
	else
		puts "Trunk is full"
	end
end