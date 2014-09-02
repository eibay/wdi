require 'pry'

class Greeter

  def initialize(greeting, name)
    @greeting = greeting
    @name = name
	end

	def greet
		puts "#{@greeting}"
	end

	def self.random_greet
		greetings = ["Hola", "Wassup", "Hey, how's it going?", "Come here often?"]
		@greeting = greetings[rand(greetings.length)]
	end

end

greeter = Greeter.new(Greeter.random_greet, "Wally")

greeter.greet

