class Comedian
	def initialize(info)
		@name = info["name"]
		@age = info["age"]
		@joke = info["joke"]
	end

	def getInfo
		return {
			"name" => @name,
			"age" => @age,
			"joke" => @joke
		}
	end
end