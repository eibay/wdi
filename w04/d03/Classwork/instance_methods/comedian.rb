# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(attributes) # this can be a hash that is created in the program
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def tell_joke
		puts @fav_joke
	end

	def getInfo
		return { name: @name, age: @age, fav_joke: @fav_joke }
	end

	def get_the_name
		return @name
	end

	def get_the_age
		return @age
	end

	def get_the_joke
		return @fav_joke
	end

end