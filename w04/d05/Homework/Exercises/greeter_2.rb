require 'pry'
require 'json'
require_relative './model'

greeters = []

class Greeter < Model
#yes, I have a method I never use (?)
	def greet
		puts "#{@attributes["greeting"]}"
	end

	def self.random_greet
		greetings = ["Hola", "Wassup", "Hey, how's it going?", "Come here often?"]
		@greeting = greetings[rand(greetings.length)]
	end

end

puts "Give me a name for the new greeter."
name = gets.chomp

greeting = Greeter.random_greet

greeter = Greeter.create({greeting: greeting, name: name})

greeters << greeter

greeters_parse = JSON.parse(File.read('./greeters.txt'))

greeters_parse.each do |g|
 	puts "My name is " + g["name"] + ". " + g["greeting"]
end





