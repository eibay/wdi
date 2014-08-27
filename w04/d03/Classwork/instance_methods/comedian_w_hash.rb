require 'pry'
require_relative './comedian.rb'



# puts "What is your name?"
# name = gets.chomp

# puts "What is your age?"
# age = gets.chomp

# puts "What is your favorite joke?"
# fav_joke = gets.chomp

comedian1 = Comedian.new({"name" => "Rodney", "age" => 85, "fav_joke" => "Why did the chicken cross the road?"})
comedian2 = Comedian.new({"name" => "Jerry Seinfeld", "age" => 55, "fav_joke" => "You had to get the big salad."})
comedian3 = Comedian.new({"name" => "Eddie Murphy", "age" => 50, "fav_joke" => "@#!*^"})

comedians = [comedian1, comedian2, comedian3]

comedians.each do |comedian|
	puts comedian.getInfo["name"]
	end	
