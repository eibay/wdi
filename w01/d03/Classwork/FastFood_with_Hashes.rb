menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
 
order = ["Soda", "Kale Salad", "Fries"]

#goal with hash approach is still to loop through the order

#we want the value of menu["Soda"] + menu ["Kale Salad"] + menu["Fries"]

#solving using simple actual variables:
#total_completion_time = menu["Soda"] + menu["Kale Salad"] + menu["Fries"]
# gives us => 9


#looping thru via index values

order_index = 0
total_completion_time = 0
while order_index < order.length #this returns the number of items in the order (because length is always going to be one character londer than index which starts at 0 vs length which starts at 1)
	item = order[index] #this gets the item at this index number in the order
	item_completion_time = menu[item] #for each 'item', lets FIND its value in menu
	total_completion_time = total_completion_time + item_completion_time
	puts total_completion_time
	order_index += 1
end