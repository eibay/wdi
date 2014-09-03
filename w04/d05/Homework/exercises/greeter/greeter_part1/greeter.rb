require "pry"

class Greeter

	def initialize(name, greeting)
		@name = name
		@greeting = greeting
	end

	def greet
		puts @greeting
	end

	def self.stock_greeting
		greetings = ["So nice to see you!", "You're looking svelte!", "Hello and best wishes!", "It's been too long!"]
		greetings[rand(0..3)]
	end

end