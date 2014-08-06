menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
order = []
total_cooktime = 0
order_complete = "no"

puts "What is your first item?"
order_item = gets.chomp
order << order_item
total_cooktime = menu.index(order_item) + 1.0
puts "Is that all?"
order_complete = gets.chomp
while order_complete == "no"
	puts "What else do you want?"
	order_item = gets.chomp
	order << order_item
	total_cooktime = total_cooktime + menu.index(order_item) + 1.5
	puts "Is that all?"
	order_complete = gets.chomp
end
puts "That will be #{total_cooktime} minutes."
puts order
