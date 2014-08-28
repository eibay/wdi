require 'pry'
require_relative './comedian'

comedians = []

loop do
	
	puts "What is your first name?"
	name = gets.chomp

	puts "What is your age?"
	age = gets.chomp

	puts "What is your favorite joke?"
	fav_joke = gets.chomp

	name = Comedian.new(name, age, fav_joke)
	comedians.push(name)

	puts comedians

end