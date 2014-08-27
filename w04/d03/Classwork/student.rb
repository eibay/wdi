require_relative('./comedian')
require'pry'
comedians =[]

loop do 
	puts "What is comedians first name"
	name = gets.chomp

	puts "What is comedians age"
	age = gets.chomp

	puts "What is comedians joke"
	fav_joke = gets.chomp

comedian = Comedian.new(name, age, fav_joke)
comedian_name = comedian.tell_name
comedian_age = comedian.tell_age
comedian_joke= comedian.tell_joke

comedians.push(comedian_name)
comedians.push(comedian_age)
comedians.push(comedian_joke)
puts comedians
end
