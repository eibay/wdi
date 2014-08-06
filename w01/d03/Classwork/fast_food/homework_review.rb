menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

total_completion_time = 0

order_index = 0

#this index is used to loop through the order array.

while order_index < order.length
	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time
	order_index += 1
end

puts total_completion_time