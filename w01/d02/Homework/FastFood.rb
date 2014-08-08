menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

order = []

# I wanted to put each order item into a new array as an integer value
# Then find the sum of the new array

puts "What would you like to order? One Item at a time, please."
customer_order = gets.chomp.capitalize 
order << menu.index(customer_order) + 1 

puts "Anything else?"
customer_order = gets.chomp.capitalize
order << menu.index(customer_order) + 1 

sum = 0

for i in order
	sum += i
end

puts "Your order will take #{sum} minutes"

# Don't know how to take into account spaces in words, so only works for single word items
# Seems like this worked..then would put in loop



while customer_order != "no"
	puts "Anything else?"
	customer_order = gets.chomp.capitalize
	order << menu.index(customer_order) + 1 