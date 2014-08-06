# Calculates how fast you will get your food

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
menu_times = {}
t = 0
order_time = 0
order = []
done = false

# Generate times and put them in an array
menu.each do |x|
	t += 1
	menu_times[x] = t
end

# Display Menu
puts "MENU"
menu.each {|x| puts x}
puts " "

# Get User's order
puts "What would you like to start with?"
puts " "
item = gets.chomp
if menu.include?(item)
	order << item
else
	puts "That's not on the menu"
end

while !done
	puts " "
	puts "Anything else?"
	puts " "
	add_item = gets.chomp
	unless add_item == "no"
		if menu.include?(add_item)
			order << add_item
		else 
			puts "That's not on the menu"
		end
	else 
		puts " "
		puts "Ok, you ordered:" 
		order.each do |x| 
			puts x
			order_time += menu_times[x]
		end
		delay = order.length * 0.5 # calculate 30 sec delay between completion of each item
		order_time += delay # add delay to order time
		puts " "
		puts "Your order will be ready in #{order_time} minutes"
		done = true
	end
end
