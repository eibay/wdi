require_relative './model'

class Greeter < Model
	def initialize(greeting, name)
    	@greeting = greeting
    	@name = name
	end

	def greet
		puts "#{@greeting}, I'm #{@name}"
	end

	def self.greet
		premade = ["Hello!", "Aloha!", "wazzzzzzzup?", "Good day."]
		premade.sample
	end
end