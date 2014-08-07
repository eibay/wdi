

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]


order = ["Soda", "Pizza", "Hamburger"]

total = 0

index = 0
while index < order.length
	item_completion_time = menu.index(order[index]) + 1
	
	total += item_completion_time
	puts total 
	index +=1
	end
puts total 