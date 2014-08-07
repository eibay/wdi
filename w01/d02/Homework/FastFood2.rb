menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
order = ["Soda", "Pizza", "Hamburger"]

order_index = 0
total_completion_time = 0

#looping thru via index values
while index < order.length
item = order[index] #this gets the item at this index number
	item_completion_time = menu.index(item) + 1 
	#re: meun.index(item) we're searching for the index spot that this item is going to be at
	#re: plus 1 - we're adding one because each item takes 1 more minute to cook than the one before

	# using .index(parameter we pass in parenthesis is the item who's index positionw we want to find)
	#menu.index("Pizza") = gives => 8
	total_completion_time += 1 item_completion_time #this increments the total completion time by the item completion time of the current item
	puts total_completion_time
	order_index += 1