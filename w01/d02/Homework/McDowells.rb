# # Well, I got two orders to work, and could get a third with another iteration of the code, but I'm pretty sure I've missed the easier solution :)

menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
# menu_item = 0
# menu_item2 = 0
# puts("Welcome to McDowell's, home of the golden M.  May I take your order? Please choose from #{menu}")
# order = gets.chomp.downcase
# puts("anything else?")
# order2 = gets.chomp.downcase

# while menu_item <= 9
# if order == menu[menu_item].downcase
# 	order_time = menu_item + 1
# 	puts("You'd like some #{order}? It'll be out in just #{order_time} minutes.")
# 	menu_item = 10
# elsif
# 	order != menu[menu_item].downcase
# 	menu_item += 1
# else
# 	puts("hmm...")
# end
# end
# if order2 != "no"
# while menu_item2 <=9
# if order2 == menu[menu_item2].downcase
# 	order_time2 = menu_item2 + 1.5
# 	puts("You'd like some #{order2} as well? It'll be out in just #{order_time2} minutes.")
# 	menu_item2 = 10
# elsif
# 	order2 != menu[menu_item2].downcase
# 	menu_item2 += 1
# else
# 	puts("hmm...")
# end
# end
# else
# 	puts("Enjoy your meal!")
# end


order = ["Soda", "Pizza", "Hamburger", "Fries"]
order_index = 0 #this index is used to loop through the order array
total_completion_time = 0
while order_index < order.length
	item = order[order_index]
	item_completion_time = menu.index(item) + 1 # takes item from order array and looks up it's index in menu and sets it to variable
	puts item_completion_time
	total_completion_time += item_completion_time
	order_index += 1

end

puts total_completion_time