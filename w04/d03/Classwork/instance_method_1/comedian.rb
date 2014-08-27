# create a class called Comedian
# give it a joke method that will puts your favorite joke

class Comedian

	def initialize (name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def joke
		puts "My name is #{@name}, I am #{@age} years old and my favorite joke  is #{fav_joke}. Funny, right?"
end
end

jeff = Comedian.new("Jeff", 25, "I'm the kind of guy who stops the microwave at 1 second just to feel like a bomb defuser.") 
puts jeff.joke 


