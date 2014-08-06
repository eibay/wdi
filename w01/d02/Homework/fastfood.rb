menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]

puts menu[menu.length-1]

n = 0
total_time = [0]

while n <= (menu.length - 1)
	time = menu.index(menu[n]) + 1
	 
	total_time.push(time)
end

while n <= (total_time.length - 1)
	return total_time(n) 
	n += 1