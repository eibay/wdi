require 'pry'

# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(com)
		@name = com["name"]
		@age = com["age"]
		@fav_joke = com["fav_joke"]
	end


	def get_info
		puts "#{@name} is a great comedian, #{@age} years old. His fovorite joke is #{@fav_joke}"
	end



	# def get_info
	# 	return {"name" => @name,
	# 			"age" => @age,
	# 			"joke" => @fav_joke}
	# end

end