menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
# order = []
# total_cooktime = 0
# order_complete = "no"

# puts "What is your first item?"
# order_item = gets.chomp
# order << order_item
# total_cooktime = menu.index(order_item) + 1.0
# puts "Is that all?"
# order_complete = gets.chomp
# while order_complete == "no"
# 	puts "What else do you want?"
# 	order_item = gets.chomp
# 	order << order_item
# 	total_cooktime = total_cooktime + menu.index(order_item) + 1.5
# 	puts "Is that all?"
# 	order_complete = gets.chomp
# end
# puts "That will be #{total_cooktime} minutes."
# puts order

#=============

order = ["Soda", "Pizza", "Hamburger"]
order_index = 0 # declare outside loop so it doesn't just change every time
total_completion_time = 0

while order_index < order.length
	item_completion_time = menu.index(order[order_index]) + 1
	total_completion_time += item_completion_time
	order_index += 1
end

puts total_completion_time