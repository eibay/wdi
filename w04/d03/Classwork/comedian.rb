require "pry"

# you make the comedian instances tell the jokes, rather than
# the idea of a Comedian tell a joke 

class Comedian

	def initialize(name, favorite_joke)
		@name = name
		@favorite_joke = favorite_joke
	end

	def hard_drive()
		puts "I named my hard drive 'dat ass' so once a month my computer asks if I want to 'back dat ass up'."
	end

	def tell_joke()
		puts @favorite_joke
	end

	def laugh
		puts "Hahaha"
	end

binding.pry
end