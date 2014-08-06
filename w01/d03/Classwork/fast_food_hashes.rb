menu = {
 	"Soda" => 1, 
 	"Chicken Tenders" => 6, 
 	"Fries" => 2, 
 	"Cheeseburger" => 7, 
 	"Deluxe Triple Hamburger and Bacon Combo" => 18, 
 	"Pizza" => 9, 
 	"Kale Salad" => 6
 }

order = ["Soda", "Kale Salad", "Fries"]

index = 0
total_completion_time = 0

while index < order.length
	item = order[index]
	item_completion_time = menu[item]
	total_completion_time += item_completion_time

	puts "Order of #{item} will take #{total_completion_time} minutes."

	index += 1
end

puts "Total time will be #{total_completion_time} minutes."