menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
i = 0
total = 0
order_item = ""

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
puts "What do you want order?"
order_item = gets.chomp

	if menu.include?(order_item)
		time = menu.index(order_item) + 1
		print "Takes "
		print time
		print "min"
		puts ""
	else
		puts "Out of order"
		# puts "Anything else? (Type the other items or 'Thats it')"
		# order_item = gets.chomp
end

# while order_item == menu.index
# 	time = menu.index(order_item) + 1
# 	print "Takes "
# 	print time
# 	print "min"
# 	puts "Anything else?"







