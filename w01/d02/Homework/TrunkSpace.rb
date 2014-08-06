trunk = []

items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

puts "Add Items into Trunk?"
user_input = gets.chomp

if user_input == "yes"
	i = 0
	while (i < 6 && user_input != "no")
		trunk << items[i]
		puts "Added #{trunk[i]}"
		puts "Another item?"
		user_input = gets.chomp
		if user_input == "yes"
			i += 1
			if i == 6 
				puts "Sorry, Trunk is Full!"
			end
		else	
			puts "OK"
		end
	end
else 
	puts "Ok"
end




