# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 
# - Make an array of 3-5 comedians
# - Have them all tell jokes

class Comedian

	comedians = []

	comedians = Comedian.new(name, age, fav_joke)

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def tell_joke
		puts @fav_joke
	end

end