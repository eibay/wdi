# emails = { 
# 	"Harry" => "harry_potter@hogwarts.edu"
# 	"Jill" => "j_ortenberg@yahoo.com"
# 	"arthur" => "arthur_weasley@ministryofmagic.gov.uk"
# }


# email.key("harry_potter@hogwarts.edu")



# zoo = {
# 	"barney" => "dinasour",
# 	"sam" => "arangatang",
# 	"chilly" => "sloth",
# 	"jonah" => "goat"
# }

# puts zoo
# puts zoo.key("sloth")
# puts zoo["sam"]
# zoo.delete("jonah")

# # add to a hash
# zoo["mark"] = "bunny"


# fast food again

# it's a hash, not an array

# menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

# order = ["chicken tenders", "Hot Dog", "Pizza"]

# order_index = 0
# while order_index < order.length
# 	item = order[order_index]
# 	item_completion_time = menu.index(item) + 1
# 	total_completion_time += item_completion_time

# 	puts total_completion_time
	
# 	order_index += 1
# end
# puts total_completion_time

   #go through order
   #find how long item takes

menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries"]

order_index = 0
total = 0
while order_index < order.length
	item = order[order_index]
	total = total + menu[item]
	order_index += 1
end

puts total

fav_artists = {radiohead: ["Ok, Computer", "In Rainbows"],

}
# add an other artists
fav_artist[:Beatles].push("Abbey Road")


fav_artists[:Beatles][1]

# total = menu["Soda"] + menu["Kale Salad"] + menu["Fries"]

zoo = {
	dinasour: ["barney", "sharon", "blah"],
	chimpanzee: ["cindy", "phil", "amy"],
	giraffe: ["necky", "stripe", "tally"],
	lion: ["scary", "lonere", "phil"],
}

puts zoo
zoo[:giraffe].push("jerry", "jill")
puts zoo[:giraffe]
zoo[:giraffe][2]
zoo.key(["cindy", "phil", "amy"])

users[jeff:]












