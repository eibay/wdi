class Comedian
	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def name
		puts @name
	end

	def age
		puts @age
	end

	def fav_joke
		puts @fav_joke
	end

	def hello
		puts "I am #{@name}, a #{@age} year old.
		My favorite joke is #{@fav_joke}"
	end
end
