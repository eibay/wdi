require 'pry'

@greeting_list = []

class Greeter
	def initialize(greeting, name)
		@greeting = greeting
		@name = name
		@greeting_list << @greeting
	end

	binding.pry

	def greeting()
		puts @greeting
	end

	def self.choose()
		
	end
end	