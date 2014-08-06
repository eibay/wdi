# menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# puts menu[menu.length-1]

# n = 0
# # total_time = [0]

# while n <= (menu.length - 1)
# 	time = menu.index(menu[n]) + 1
# 	n += 1
# 	puts time
# 	# total_time.push(time)
# end



# while n <= (total_time.length - 1)
# 	return total_time(n) 
# 	n += 1
# 	puts total_time += total_time
# end
# puts total_time

#this index is used to loop through the array
menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

index = 0

total_completion_time = 0

while index < order.length
	item_completion_time =  menu.index(order[index]) + 1
	total_completion_time += item_completion_time
	puts total_completion_time
	index += 1
end

puts total_completion_time