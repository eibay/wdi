# zoo = {}
# zoo["Sam"] = "Lion"
# zoo["John"] = "Zebra"
# zoo["Ken"] = "Cat"
# zoo["Mike"] = "Dog"
# zoo["Harry"] = "Dolphine"

# puts zoo["Sam"]
# puts zoo.key("Dog")
# puts zoo["John"]
# puts zoo.values_at("Mike")

# menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
#   order = ["Soda", "Kale Salad", "Fries"]

#   total_completion_time = 0
#   index = 0
#   item = order[index]

#   # puts menu.values_at(item)

# while index < order.length
# 	item = order[index]
# 	puts menu.values_at(item)
# 	total_completion_time += menu.keys
# 	index += 1
# end

zoo = {
	Lion: ["Sam", "John"],
	Penguin: ["Ken", "Mike"],
	Cat: ["Mi", "Miu"]
}

puts zoo[:Lion]
puts zoo[:Penguin]
puts zoo[:Lion][0]