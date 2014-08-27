class Dog

	def initialize(name, age, breed)
		@name = name
		@age = age
		@breed = breed
	end

	def bark
		puts "WOOOOF!"
	end

	def hello
		puts "I am #{@name}, a #{@age} year old #{@breed}"
	end
end