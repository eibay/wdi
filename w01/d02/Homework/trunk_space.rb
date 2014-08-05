trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
add = true
puts "Here are some things you can put in the trunk of this driverless car: #{items.join(", ")}."

while add
	puts "Would you like to put something in the trunk? Enter 1 for yes and 2 for no."
	permission = gets.chomp
	#First, we see if the user wanted to put anything in the trunk.
	if permission == "1"
		# And, is there room in the trunk?
		if trunk.length < 6
			# Now we let the user select an item from the list
			puts "Which of these items should we put in the trunk?"
			luggage = gets.chomp
			# Does the user HAVE that item?
			if items.include?(luggage)
				trunk.push(items.delete(luggage))
				puts "OK, you put the #{luggage} in the trunk."
				puts "Here's what's in the trunk: #{trunk.join(", ")}."
				puts "And here are the remaining items: #{items.join(", ")}."
			else
				# Note that an item is removed from the list when it's added to the trunk
				puts "You can't put that in the trunk! You don't have one! Not even one!"
				puts "Here's that list of what you DO have: #{items.join(", ")}."
			end
		else
			puts "You already put six things in the trunk. You can't put in any more!  Didn't I mention that?"
			add = false
		end
	elsif permission == "2"
		puts "Oh, OK. The car's going to leave now. Here's what's in the trunk: #{trunk.join(", ")}."
		add = false
	else
		puts "I didn't get that. I'm gonna ask again. Focus this time."
	end
end
puts "The car's leaving now!  It's got #{trunk.join(", ")} in the trunk.  Wave goodbye!"
