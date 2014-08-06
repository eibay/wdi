x=0
total = []
menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]



while menu.length > x 
	order_time = (menu.index(menu[x]) + 1) 
	x += 1
	
	total.push(order_time)


end
puts total
print total

=begin
can't figure out how to add the order times together
wanted to push all output of order_time to an array, total. Then add them together somehow. not 100% sure what the next steps are. 

order_time.push(total)
=end
