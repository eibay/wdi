class Dog

	def initialize(name, age, breed)
		@name = name
		@age = age
		@breed = breed
	end

	def bark
		puts "WOOOF!"
	end

	def hello
		puts "Hello, I am #{@name}, a #{@age} year old #{@breed}."
	end

end