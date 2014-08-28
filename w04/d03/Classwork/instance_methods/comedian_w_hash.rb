require 'pry'
require_relative './comedian.rb'

comedians = []

# puts "What is your name?"
# name = gets.chomp

# puts "What is your age?"
# age = gets.chomp

# puts "What is your favorite joke?"
# fav_joke = gets.chomp

info = {"name" => "Rodney", "age" => 85, "fav_joke" => "Why did the chicken cross the road?"}
comedian2 = Comedian.new({"name" => "Jerry Seinfeld", "age" => 55, "fav_joke" => "You had to get the big salad."})
comedian3 = Comedian.new({"name" => "Eddie Murphy", "age" => 50, "fav_joke" => "@#!*^"})

comedian1 = Comedian.new(info)

comedians = [comedian1, comedian2, comedian3]

comedians.each do |comedian|
	puts comedian.getInfo["name"]
	end	


require_relative './comedian'
require 'pry'


comedians = []

info = {"name" => "sean", "age" => 68, "joke" => "something funny"}
comedians << Comedian.new(info)

info = {"name" => "jeff", "age" => 68, "joke" => "something funny haha"}
comedians << Comedian.new(info)

info = {"name" => "neel", "age" => 68, "joke" => "something funny wow"}
comedians << Comedian.new(info)

comedians.each do |comedian|
	puts "comedian " + comedian.getInfo["name"] + " is " + comedian.getInfo["age"].to_s + " years old and has the joke " + comedian.getInfo["joke"]
end