##***Bonus*** - Fast Food

# - **Goal**: Create an application that can predict how long it will take for an order at a fast food restaurant to be completed
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
# - **Bonus**: Lets now assume that there is a 30 second delay between the completion of each item. Re-write the application to take this into account.
#dont use hashes!

# outputs = order and completion_time


# we start with
# completion_time for menu_item[index] = completion_time for menu_item[index-1] + 1 minute

# # trying it without a hash
# soda = "Soda", 
# fries = "Fries", 
# milkshake = "Milkshake", 
# chicken_tenders = "Chicken Tenders", 
# hot_dog = "Hot Dog", 
# hamburger = "Hamburger", 
# chicken_sando = "Chicken Sandwich", 
# double_cheese = "Double Cheeseburger", 
# pizza = "Pizza"

# completion_time



# trying it without a hash - #2
# index = 0
# completion_time = menu_item[index+1]
# completion_time = menu_item[index] = completion_time for menu_item[index-1] + 1 minute




# trying it with a hash
index = 0
menu_items = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# menu_items.each {|item, index| completion_time = menu_items[index + 1]} 

menu_items.each {|item, index| completion_time = menu_items[index] + 1} 
order_status = Hash.new { |item, completion_time| puts "#{item}: #{completion time}" }





