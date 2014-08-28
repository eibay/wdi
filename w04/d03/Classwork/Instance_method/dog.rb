class Dog

		def initialize(name, age, breed)#not convention but syntax creating new instances can set all kinds of variable.
					#Dog.new("fido", 12) fido and 12 are arguments but if you don't have the third argument it will give you error of 2 for 3.
					@name = name
					@age = age
					@breed = breed

		end

	def bark
		
		puts "WOOOF!"
	end

	def hello

		puts "Hello! I am #{@name}, a #{age}, year old #{@breed}"

	end

end

# class Dog

# 	def self.bark
# 		puts "WOOOF!"
# 	end

# end