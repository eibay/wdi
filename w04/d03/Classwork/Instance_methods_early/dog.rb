class Dog

	def initialize(name, age, breed)
		@name = name
		@age = age
		@breed = breed
	end

	def bark
		puts "WOOOOF!"
	end

end

class Comedian

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def joke
		puts "#{@fav_joke}"
	end

end

com1 = Comedian.new("Shecky", 124, "A guy walks into a bar...")  
com2 = Comedian.new("Lenny", 44, "I'm so persecuted.")          
com3 = Comedian.new("Bozo", 33, "What’s the best part about living in Switzerland? Not sure, but the flag is a big plus.")                        
