 menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
  order = ["Soda", "Kale Salad", "Fries"]
# soda is 1, kale is 6, fries is 2

order_index = 0 
total_completion_time = 0

while order_index < order.length
	item = order[order_index]
	item_completion_time = menu[item]
	total_completion_time += item_completion_time
	order_index += 1
end

puts total_completion_time