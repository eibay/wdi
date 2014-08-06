trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
index = 0

# while index < 6
# 	trunk << items[index]
# 	puts"You've got a #{trunk[index]} in your trunk"
# 	index += 1
# 	if index == 6
# 		puts "Too much junk in your trunk! Can't add any more items"
# 	end
# end

space = true 

while space 
	trunk.each do |x| # lists trunk items
		if x[-1] == "s" # checks if item is plural
			puts "#{x} are in your trunk" 
		else
			puts "#{x} is in your trunk"
		end
	end
	puts " "
	puts "Here's what you've got:"
	items.each {|x| puts x}
	space = false
	puts " "
	puts "What do you want put in your trunk?"
	put_trunk = gets.chomp
	if items.include?(put_trunk) # checks if item is in items array
		if trunk.length < 6
			trunk << put_trunk # if yes adds to trunk
			puts " "
			puts "-----"
			puts " "
			items.each do |x| # removes item from items array
				if x == put_trunk
					items.delete(x)
				end
			end
			space = true
		else
			puts " "
			puts "Sorry, too much junk in your trunk!"
		end
	else
		puts " "
		puts "Sorry you don't have that"
		puts "  "
		puts "-----"
		puts " "
		space = true
	end
end
