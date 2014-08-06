menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
# i = 0
# total = 0
# order_item = ""

# while i < 8
# 	order_time = order_time + i + 1
# 	print menu[i]
# 	print ":"
# 	print order_time
# 	print "min"
# 	puts ""
# 	i += 1
# end

# def orderTime(i)
# 	order_time = i + 1
# 	puts order_time
# end

# orderTime(3)
# puts "What do you want order?"
# order_item = gets.chomp

# 	while (menu.include?(order_item) && answer != "No")	
# 		order << order_item
# 		time = menu.index(order_item) + 1
# 		puts "Anything else?"
# 		answer = gets.chomp
# 	end
# 		puts "Out of order"
# 	end
# 	print "#{order}"
# 	print " take #{time}"
# end

menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}

order = ["Soda", "Kale Salad", "Fries"]



total_completion_time = 0

order_index = 0

while order_index < order.length
	item = order[order_index]
	item_completion_time = menu[item]
	total_completion_time += item_completion_time

	puts total_completion_time

	order_index += 1
end

puts total_completion_time





