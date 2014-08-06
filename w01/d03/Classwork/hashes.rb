


# zoo = {}
# zoo["sam"] = "lion"
# zoo["tim"] = "seal"
# zoo["leo"] = "puffin"
# zoo["howard"] = "worm"
# zoo["frank"] = "seahorse"
# zoo["brook"] = "worm"



# puts zoo["sam"]
# puts zoo.key("seahorse")
# puts zoo.key("worm")
# puts zoo["frank"]

# puts zoo["tim"]
# puts zoo["leo"]



# order = ["Soda", "Pizza", "Hamburger", "Fries"]
# order_index = 0 #this index is used to loop through the order array
# total_completion_time = 0
# while order_index < order.length
# 	item = order[order_index]
# 	item_completion_time = menu.index(item) + 1 # takes item from order array and looks up it's index in menu and sets it to variable
# 	puts item_completion_time
# 	total_completion_time += item_completion_time
# 	order_index += 1

# end

# puts total_completion_time

# menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
# order = ["Soda", "Kale Salad", "Fries"]

# order_index = 0 #starts at the first item in the order
# total_completion_time = 0 
# item_completion_time = 0
# while order_index < order.length #as long as there is an item in order left to iterate
# 	total_completion_time = item_completion_time += menu[order[order_index]] #total time gets the value from the corresponding menu key added to it
# 	order_index += 1 #goes to the next item in the order
# end

# puts total_completion_time


zoo = {}
zoo = {penguins: ["Sam", "Lois", "Tom"]}
zoo[:puffins] = []
puts zoo
zoo[:puffins].push("Elliot", "Maya", "Jack")
puts zoo

puts zoo[:puffins][1]















