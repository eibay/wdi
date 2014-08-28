require 'pry'

class Comedian

	attr_accessor :fav_joke

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end 

	def joke
		puts @fav_joke
	end

end
binding.pry