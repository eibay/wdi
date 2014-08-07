trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

=begin
	
**Spec:**
  - Add items to the trunk
  - Be prevented from adding more than 6 items
  - Recieve a warning saying "Trunk is full" when attempting to add a 7th item.
- **Things to consider:**
	- How will you represent the trunk in your code?
      - Use the below starter code for guidance
      - Note that the array of items has more than 6 items, so not all of them should be able to fit in the trunk array.
  - Think about how a loop can help you accoplish the spec
  
=end


=begin

#this would probably populate the trunk array all at one time
index = 0
items.each do 
|item, index| trunk.push(item)
end
=end

=begin
while index <= 6
		items.each do 
		|item, index| trunk.push(item)
		index += 1
		end
end
puts "Trunk is full!"
=end

trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
index = 0
puts "Do you want to add an item?"
user_response = gets.chomp

while user_response == "yes" && index < 6
	trunk.push(items[index]) #this is to add just one item at at time
	index += 1
	if index < 6
		puts "do you want to add an item?"
		user_response = gets.chomp
	# if index <= 6
	# 	items.each do 
	# 	|item, index| trunk.push(item)
	# 	index += 1
	# 	end
	else puts "Trunk is full!"
	end
end







