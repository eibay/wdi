class Dog
	def initialize(name, age, breed)
		@dog_name = name
		@dog_age = age
		@dog_breed = breed
	end
	def bark
		puts "Woof!"
	end

	def hello
		puts "Hello! My name is #{@dog_name}. I am #{@dog_age} years old and I am a #{@dog_breed}"
	end 
end

class Comedian
	def initialize(name, joke)
		@name = name
		@joke = joke
	end
	def tell_joke
		return "My name is #{@name}. This is my favorite joke: #{@joke}!"
	end  
	def laugh
 		return "hahah"
	end 

end

#instead of putting all the information into the method, you can pass it through to maintain dynaism.