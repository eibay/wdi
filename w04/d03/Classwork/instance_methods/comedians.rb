require 'pry'
class Comedian


	attr_accessor :name
	attr_accessor :age
	attr_accessor :favorite_joke

	def initialize(name,age,favorite_joke)
		@name=name
		@age=age
		@favorite_joke=favorite_joke
	end

	def fav_joke

		puts"Hi my name is #{@name} and I'm #{@age} years old. I have a joke for you. #{@favorite_joke}"
	end
end


