  menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
  order = ["Soda", "Kale Salad", "Fries"]

  total_completion_time = 0

  order_index = 0

  while order_index < order.length
  	item = order[order_index]
  	item_completion_time = menu[item]   #to pull the menu hash item value
  	total_completion_time += item_completion_time
	
#	puts total_completion_time

	order_index += 1
  end

	puts total_completion_time

# # want to say, if I have an order what is total time for , e.g., order = ["Soda", "Pizza", "Hamburger"]

# # biggest tool is while loop. Key is direct value between index value and time to complete, perfectly correlated.
# order = ["Soda", "Pizza", "Hamburger"]

# total_completion_time = 0  #because you want the value of the variable to persist, you define it outside the loop


# # this index is used to loop through the order array
# order_index = 0        #declare variable outside the loop, NOT INSIDE. you want the loop to restart without resetting the initial variable; when you want the loop, not the definition to control value


# while order_index < order.length   #when to stop, loop not thru menu, but thru order ; .length will always be one higher than last index number, counting the elements

#         #big question  we're working on is about the time to complete each
#         item_completion_time = menu.index(order_index)  #know value from position of soda index in menu; use method .index; need parameter () to evaluate to order array
#               #go to order array and check VALUE OF INDEX (which we've initially defined as 0); first will get value of Soda, then Pizza, then Hamburger
#         puts total_completion_time
#         order_index += 1  #this makes the iteration move thru the target array

# end

# puts total_completion_time
