# ask user for first, last, email
# print to terminal all students (list all)
# repeat
require 'pry'
require_relative './comedian'

comedians = []

loop do

	puts "What is your name?"
	name = gets.chomp

	puts "What is your age?"
	age = gets.chomp

	puts "What is your joke?"
	fav_joke = gets.chomp

		info = { name: "sean", age: "23",}
	mitch = Comedian.new(info)
	puts mitch.getInfo["age"]



	mitch = Comedian.new( name, age, fav_joke )
	puts mitch.getInfo["age"]

	comedians << comedian

	put comedian.get_the_name + "is" comedian.get_the_age + "years old"


	# comedians.each do | x |
	# 	puts @name
	# 	puts @age
	# 	x.tell_joke	
	# end


end
