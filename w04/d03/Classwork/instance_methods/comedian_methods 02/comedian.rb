class Comedian

	def initialize(attributes)
		@name = attributes["name"]
		@age = attributes["age"]
		@joke = attributes["joke"]
	end

	def getInfo
		return {"name" => @name, "age" => @age, "joke" => @joke}
	end

	def smooth_return
		return "#{@name} is #{@age} and their favorite joke is #{@joke}"
	end
end