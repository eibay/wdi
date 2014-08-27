class Comedian

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end


 def joke
 	puts @fav_joke

 end

 def name 
 	puts @name
 end

 def introduction
 	puts "My name is #{@name}. I am #{@age} years old."
 end
 

end
