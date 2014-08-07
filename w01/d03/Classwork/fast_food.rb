menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries"]

i=0
total_completion_time=0

while i < order.count
item_completion_time= menu[order[i]]
	total_completion_time += item_completion_time
	i += 1
end

puts total_completion_time


# menu =["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]


# order = ["Soda" , "Pizza", "Hamburger"]

# i = 0

# total_completion_time= 0
# additional_time= (order.length-1)*0.5
# while i < order.count

# item_completion_time = menu.index(order[i])+1
# puts "#{order[i]} will take #{item_completion_time} minute(s)"
# total_completion_time += item_completion_time
# i += 1
# end
# total=total_completion_time+additional_time
# puts "The Total completion time is #{total} minute(s)."




