# zoo = {}
# zoo["Zee"] = "Zebra"
# zoo["Leo"] = "Lion"
# zoo["Tigger"] = "Tiger"
# zoo["Muby"] = "Emu"
# zoo["Alfie"] = "Alpaca"

# puts zoo["Leo"]
# puts zoo.key("Lion")
# puts zoo["Tigger"]
# puts zoo.key("Emu")
# puts zoo["Alfie"]

#-----

#  menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
#  order = ["Soda", "Kale Salad", "Fries"]

# order_index = 0
# total_completion_time = 0

#  while order_index < order.length
#  	item = order[order_index]
#  	item_completion_time = menu[item]
#  	total_completion_time += item_completion_time

#  	puts total_completion_time

#  	order_index += 1

#  end

#-----

zoo = {}
zoo[:Lion] = ["Leo", "Anthony", "Fred"]
zoo[:Tiger] = ["Lauren", "Joe", "Stephanie"]
zoo[:Monkey] = ["Barbara", "Jackie", "Steve"]
zoo[:Sheep] = ["Martin", "Jamie", "Eloise"]
zoo[:Otter] = []
zoo[:Otter].push("David", "Perry", "Jason")

puts zoo[:Monkey][2]
puts zoo[:Otter][1]
zoo[:Tiger][2] = "Jane"
puts zoo[:Tiger][2] 
zoo[:Lion].unshift("Lou")
puts zoo[:Lion].join(", ")
