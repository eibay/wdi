
menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

total_completion_time = 0

#this index is used to loop thorugh the order array
order_index= 0

while order_index < order.length
	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time
	#everytime the loop finishes we want to trigger the order index

	#i wanna look in menu and find the item i am searching for. take the index value and let me go to my order and get the index value.
	# give me the index value of pizza, then pizza, then hamburger
	puts total_completion_time

	order_index += 1
end


	puts total_completion_time
