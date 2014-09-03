require 'pry'
require_relative './model'


class Greeter < Model
	
	def initialize (greeting, name)
		@greeting = greeting
		@name = name
	end

	def say_hello
		puts "#{@greeting} My name is #{@name}."
	end

	def self.random
		
	random_greetings = []
		
	random_greeting1 = "¡Hola! ¿Cómo está?"
	random_greeting2 = "Guten tag! Wie gehts es Ihnen?"
	random_greeting3 = "Bonjour! Comment allez vous aujourd'hui?"
	random_greeting4 = "How the hell are you?"

	random_greetings << random_greeting1
	random_greetings << random_greeting2
	random_greetings << random_greeting3
	random_greetings << random_greeting4

	greeting = random_greetings.shuffle
	output = greeting[0] 
	return output
	end

end