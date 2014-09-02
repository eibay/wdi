# 1) make an array 3-5 comedians
# 2) have them all tell their jokes, looping through the array
require_relative '/comedian.rb'
comedians = []

mitch = Comedian.new("mitch",25, "haha")
jerry= Comedian.new("jerry",27, "stfu")
harry= Comedian.new("harry",29, "lol")

comedians << mitch
comedians<< jerry
comedians << harry

comedians.each do |comedian|

	comedian.tell_joke
end



# Class Comedian

# 	def initialize(name, age, fav_joke)
# 		@name = name
# 		@age = age
# 		@fav_joke = fav_joke
# 	end

# 	def tell_joke
# 		puts @fav_joke
# 	end

# end