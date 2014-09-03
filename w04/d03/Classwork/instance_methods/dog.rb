# class Dog 

# 	def initialize(name, age, breed)
# 		@name = name
# 		@age = age
# 		@breed = breed
# 	end

# 	def bark
# 		puts "WOOOF!"
# 	end

# 	def hello
# 		puts "HELLO! I am#{@name}, a #{@age} year old #{@breed}" 
# 	end

# end

# - create a class called 'Comedian'
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke

class Comedian

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def hello
		puts "#{@fav_joke}"
	end
end