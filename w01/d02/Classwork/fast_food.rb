menu =["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

total_completion_time = 0

#This index is used to loop through the order array

order.index = 0

while order_index < order.length

	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time
	order_index += 1

	#item_completion_time = menu.index(order[index])

puts total completion time

end

