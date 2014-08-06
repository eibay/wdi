# menu=["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
# order = ["Soda", "Pizza", "Hamburger"]
# order_index = 0
# #this index is used to loop through the order array

# total_completion_time=0

# while order_index < order.length #or < 3
	 
	
# 	item=order[order_index]
# 	item_completion_time = menu.index(item) + 1 # searches through menu for index number for the stuff in order array
# # want to find index value or order in items
# #works inwards out give me order index 0 and then find its value in items 
# order_index += 1
# total_completion_time += item_completion_time
# end

# puts "Total time is #{total_completion_time}"


menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries"]
order_index = 0
total_time=0
while order_index < order.length 
	total_time = total_time + menu[order[order_index]] #getting hash value of order items
	order_index += 1
end 
puts total_time


	

	


