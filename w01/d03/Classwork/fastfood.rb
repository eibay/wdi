# time = 1 
# menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
# m = Array.new(menu)
# menu_t = []

# while menu.length < 9
# 	puts menu.length
# 	puts menu_t.push(m.shift)
# 	# completion = time + 1
# 	# puts "#{menu_t}: #{completion}"
# end
# print menu.length
#
# Instructor's work
#
# menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# order = ["Soda", "Pizza", "Hamburger"]

# total_completion_time = 0

# order_index = 0

# while order_index < order.length
# 	item = order[order_index]
# 	item_completion_time = menu.index(item) + 1
# 	total_completion_time += item_completion_time
# 	puts total_completion_time
# 	order_index += 1
# end

# puts total_completion_time

### Using Hashes to redo

menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries", "Deluxe Triple Hamburger and Bacon Combo"]

order_index = 0 #used to iterate over the order array
total_completion_time = 0

while order_index < order.length
	#quering the menu hash for the value of item time
	completion_t = menu[order[order_index]]
	
	total_completion_time += completion_t
	order_index += 1
end
puts
puts total_completion_time






