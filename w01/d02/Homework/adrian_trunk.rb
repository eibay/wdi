


trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]



# was going to do an object with methods, but i'm too tired now
#### while loop #####
n = 0 
while trunk.count < 6

	###### was gonna do random, but its 11pm and I'm too tired to think about the if/else and comparison i'd use to stop items repeating.
	# item_to_pack = items[rand(8)]
	# trunk.push(item_to_pack)
	# puts "successfulruly added #{item_to_pack}"
	
	item_to_pack = items[n]
	trunk.push(item_to_pack)
	puts "successfully added #{item_to_pack}"
	n += 1

	if trunk.count == 6
		puts " "
		puts "Trunk is full."
		puts "Ain't nobody got space for that! t囧t"
		puts " "

		### i had an else condition, but somehow it didn't add a particular line.
	# else 
	# 	item_to_pack = items[rand(8)]
	# 	trunk.push(item_to_pack)
	# 	puts "successfully added #{item_to_pack}"
	end
end

# trunk.push(items[rand(8)]) 

print trunk 
puts " "

