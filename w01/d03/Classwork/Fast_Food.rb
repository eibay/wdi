menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

order_index = 0
total_completion_time = 0

while order_index < order.length
	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time

	puts total_completion_time
	
	order_index += 1

end

puts total_completion_time