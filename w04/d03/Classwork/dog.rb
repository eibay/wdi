class Dog

	def initialize(name, age, breed)
		@name = name
		@age = age
		@breed = breed
	end

# instance method yes
	def bark
		puts "WOOOF!"
	end

	def hello
		puts "Hello, my dog #{@name} is {@age} years old."
	end

# class method no
# 	def self.bark
# 		puts "WOOF!"
# 	end
end