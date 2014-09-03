require_relative "../model"

class Greeter < Model
	@@greetings = ["Hello", "Hi", "Greetings", "Howdy"]
	# def initialize(greeting, name)
	# 	@greeting = greeting
	# 	@name = name
	# end

	def say
		return "#{@greeting} #{@name}!"
	end

	def self.random_greeting
		return @@greetings.sample
	end
end