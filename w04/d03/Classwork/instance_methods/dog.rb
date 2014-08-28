# Class Method

class Dog

	def self.bark
		puts "WOOOF!"
	end

end

# Instance Method

class Dog

	def initialize(name, age, breed)
		@name = name #instance variable, available to other methods in the same class.
		@age = age
		@breed = breed

	end

	def bark
		puts "WOOOF!"
	end

	def hello
		puts "Hello! I am #{@name}, a #{@age}-year-old #{@breed}."
	end

end