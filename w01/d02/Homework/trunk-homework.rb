trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

i=0

while  i < 6
item=items.sample

trunk << item

if i < 5 


puts "You added #{item} to your trunk"
items.delete(item)
	
	else
		
		puts "You added #{item} to your trunk"
	puts "trunk is full"
	items.delete(item)
end
i += 1
end


