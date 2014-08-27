require 'pry'
require_relative 'comedian2.rb'


info= {"name" => "mitch", "age" => 28, "joke" => "lol"}
com = Comedian.new(info)
puts com.getInfo["age"]


comedians= []
x = 0
while x < 4

	puts "Whats the comedian's name?"
	name = gets.chomp
	puts "Whats the comedians's age"
	age = gets.chomp
	puts "Whats the comendians's joke?"
	joke = gets.chomp
	
	comedian = Comedian.new(name, age, joke)

	comedians << comedian

	x = x + 1

	puts com.name + "is" + com.age + "years old" + "and favorite joke is" + com.joke

end

