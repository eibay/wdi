require 'pry'

# - Create a class called `Comedian`
# - Give it a joke method that will puts your favorite joke
# - Give comedians the attributes - name, age, fav_joke 

class Comedian

	def initialize(info)
		@name = info["name"]
		@age = info["age"]
		@fav_joke = info["fav_joke"]
	end


	def get_info
		return {"name" => @name,
				"age" => @age,
				"joke" => @fav_joke}
	end

end