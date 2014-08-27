class Comedian

	def initialize(info)
		@getInfo = getInfo
	end

	def getInfo
		return {"name" => @name,
				"age" => @age,
				"joke" => @joke}
	end
end
