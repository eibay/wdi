class Comedian

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end
	def getinfo
		return {"name" => @name, "age" => @age, "joke" => @joke}
	end

	def string_output
		return "The comedians name is #{@name} his age is #{@age} and his favorite joke is #{@fav_joke}"
	end
end