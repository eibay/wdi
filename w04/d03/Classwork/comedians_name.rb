require 'pry'
require_relative './afternoon_comedians'

comedians = []

while

	puts "What is your first name"
	name = gets.chomp

	puts "How old are you?"
	age = gets.chomp

	puts "What is your best joke"
	joke = gets.chomp

	comedians = Comedian.new(name: name, age: age, joke: joke)

	comedians << comedian

end

comedians.comedian_info



