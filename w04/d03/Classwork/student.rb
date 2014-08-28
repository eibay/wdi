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

= Comedian.new(name, age, fav_joke)
comedian_info = comedian.getinfo

comedians.push(comedian_info)
end

puts comedians
puts comedian_info