# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(name, fav_joke)
		@name = name
		@fav_joke = fav_joke
	end

	def tell_joke
		puts @name
		puts @fav_joke
	end

end