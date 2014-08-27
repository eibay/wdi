# ask user for first, last, email
# print to terminal all students (list all)
# repeat
require 'pry'
require_relative './comedian'

comedians = []

loop do

	puts "What is your name?"
	@name = gets.chomp

	puts "What is your age?"
	@age = gets.chomp

	puts "What is your joke?"
	@fav_joke = gets.chomp

	comedian = Comedian.new( @name, @age, @fav_joke )

	comedians << comedian

	comedians.each do | x |
		puts @name
		puts @age
		x.tell_joke	
	end


end
