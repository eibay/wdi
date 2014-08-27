# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian
	def initialize(name, age, joke)
		@name = name
		@age = age
		@joke = joke
	end

	def show
		puts "#{@name} is #{@age} and says #{@joke}"
	end
end