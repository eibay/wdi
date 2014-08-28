class Comedian

	def initialize(attribute)
		@name = attribute["name"]
		@age = attribute["age"]
		@fav_joke = attribute["fav_joke"]
	end
	def getinfo
		return {"name" => @name, "age" => @age, "joke" => @joke}
	end

	def string_output
		return "The comedians name is #{@name} his age is #{@age} and his favorite joke is #{@fav_joke}"
	end
end