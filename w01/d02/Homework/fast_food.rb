# menu = {
# 	"Soda" => 1,
# 	"Fries" => 2,
# 	"Milkshake" => 3,
# 	"Chicken Tenders" => 4,
# 	"Hot Dog" => 5,
# 	"Hamburger" => 6,
# 	"Chicken Sandwhich" => 7,
# 	"Double Cheeseburger" => 8,
# 	"Pizza" => 9,
# }

# 	time = menu.inject(0) { |x,y| x += y[1] }

# 	puts "It will take about #{time} minutes to cook everything on the menu"



menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", 
	"Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = ["Soda", "Pizza", "Hamburger"]

total_completion_time = 0

# This index is used to loop through the order array
order_index = 0

while order_index < order.length
	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time

	puts total_completion_time

	order_index += 1
end

puts total_completion_time