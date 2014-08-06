menu = ["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
hungry = true
time = 0
order = []
puts menu
puts "Hey, what are you having? Hurry up, there're people waiting behind you!"
while hungry == true
	item = gets.chomp
	if menu.include?(item)
		order.push(item)
		time += (menu.index(item) + 1)
		puts "Anything else?"
	elsif item.downcase == "done"
		hungry = false
	else
		puts "Speak clearly, pal, I ain't got all day. If you don't want anything else, enter 'done'. What else you want?"
	end
end

time = ((order.length - 1) / 2.0) + time

puts "Here's your order: #{order.join(", ")}. It's gonna take #{time} minutes, or #{(time * 60).to_i} seconds."

