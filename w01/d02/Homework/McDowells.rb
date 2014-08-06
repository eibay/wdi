# Well, I got two orders to work, and could get a third with another iteration of the code, but I'm pretty sure I've missed the easier solution :)

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
menu_item = 0
menu_item2 = 0
puts("Welcome to McDowell's, home of the golden M.  May I take your order? Please choose from #{menu}")
order = gets.chomp.downcase
puts("anything else?")
order2 = gets.chomp.downcase

while menu_item <= 9
if order == menu[menu_item].downcase
	order_time = menu_item + 1
	puts("You'd like some #{order}? It'll be out in just #{order_time} minutes.")
	menu_item = 10
elsif
	order != menu[menu_item].downcase
	menu_item += 1
else
	puts("hmm...")
end
end
if order2 != "no"
while menu_item2 <=9
if order2 == menu[menu_item2].downcase
	order_time2 = menu_item2 + 1.5
	puts("You'd like some #{order2} as well? It'll be out in just #{order_time2} minutes.")
	menu_item2 = 10
elsif
	order2 != menu[menu_item2].downcase
	menu_item2 += 1
else
	puts("hmm...")
end
end
else
	puts("Enjoy your meal!")
end



