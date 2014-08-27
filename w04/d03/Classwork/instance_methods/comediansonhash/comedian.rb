class Comedian

	def initialize(hash)
		@name = hash["name"]
		@age = hash["age"]
		@joke = hash["joke"]
	end

	def getInfo
		return {
			"name" => @name,
			"age" => @age,
			"joke" => @joke
		}
	end
end
