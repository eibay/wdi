menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries"]

index = 0
total_completion_time = 0


while index < order.length
	item_completion_time = menu[order[index]]
	total_completion_time += item_completion_time
	index += 1
end

puts total_completion_time