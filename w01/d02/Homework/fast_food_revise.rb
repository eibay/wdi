menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
hungry = true
total_time = 0
order = []
puts menu
puts "Hey, what are you having? Hurry up, there're people waiting behind you!"
while hungry == true
	item = gets.chomp
	if menu.include?(item)
		order.push(item)
		total_time += (menu.index(item) + 1)
		puts "Anything else?"
	elsif item.downcase == "done"
		hungry = false
	else
		puts "Speak clearly, pal, I ain't got all day. If you don't want anything else, enter 'done'. What else you want?"
	end
end

item_time = ((order.length - 1) / 2.0)
total_time += item_time

puts "Here's your order: #{order.join(", ")}. It's gonna take #{total_time} minutes, or #{(total_time * 60).to_i} seconds."

