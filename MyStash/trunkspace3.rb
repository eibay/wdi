# this is where i was trying to let the user choose the item


items = ["Ball", "Suitcase", "Laptop", "Bag", "Gym", "Cables", "Scraper", "Tire", "Shoes"]
i = 0
trunk = []
#choice_valid = true

while trunk.length < 6 #&& choice_valid
	puts "What to put in the trunk?"
	response = gets.chomp
	if response == items[i] 
		trunk << response
		puts trunk
	#	print trunk[i].to_s ", "
		i += 1
	else 
		puts "You don't have one of those"
	end
end

puts 
puts "The trunk is full, man."



# location = "San Francisco"
# found_location = false
# valid_location = ["New York", "San Francisco", "Dallas", "Albuquerque", "Toronto"]

# i = 0

# while i < 6 && found_location
# if location == valid_location[i]
# 	found_location = true
# 	puts "Yes"
# else