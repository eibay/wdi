class Comedian

	def initialize(attr)
		@name = attr[:name]
		@age = attr[:age]
		@joke = attr[:joke]
		
	end

	def getInfo
		return {
			"name" => @name,
			"age" => @age,
			"joke" => @joke
		}
	end
end