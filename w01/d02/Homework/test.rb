x = 0 
total = []  
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]

while items.length > x                                           
	o = total.push((items.index(items[x]) + 1))                                
	x += 1     

end 

puts total