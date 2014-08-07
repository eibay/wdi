



# menu_time 
# counter = 0
# menu[1] = 1 minute
# menu[2] = 2 minutes



# counter = 0
# while counter < 8
# menu[counter] = counter + 1
# counter += 1

# it's a hash, not an array

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["chicken tenders", "Hot Dog", "Pizza"]

order_index = 0
while order_index < order.length
	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time

	puts total_completion_time
	
	order_index += 1
end
puts total_completion_time

   #go through order
   #find how long item takes