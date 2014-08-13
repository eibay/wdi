# **Goal**: Create an application that can predict how long it will take for an order at a fast food restaurant to be completed
# - **Spec**:
#   - Specify an order
#   - See a total time of completion
# - **Menu**:
# ```ruby
# ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
# ```
# - This fast restaurant has a menu that is set up in a very specific way. Each item on the menu has a completion time of exactly one minute more than the previous item on the menu.
#   - `Ex.` Soda takes 1 minute to prepare, thus Fries will take 2 minutes to prepare and a Milkshake will take 3 minutes to prepare.
# - Assume that the restaurant employees can only cook one item a time.
# - **Bonus**: Lets now assume that there is a 30 second delay between the completion of each item. Re-write the application to take this into account

## CLASS REVIEW

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger" "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = [ "Soda", "Pizza", "Hamburger"]

total_completion_time = 0
order_index = 0 
	# always declare variable outside the loop. this index is used to loop through order array

while order_index < order.length 
	# stops looping after the length of the order array
	item = order[order_index]
	item_completion_time = menu.index(item) + 1
	total_completion_time += item_completion_time
	order_index += 1
	# we are looking for the index value through the order array and through the menu array/
	# we want to find the index value of soda
	# add +1 because of the directions
	# updating the order_index by 1
	# updating the order_index by 1
end

puts total_completion_time
