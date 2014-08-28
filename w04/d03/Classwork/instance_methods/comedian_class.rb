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

##########################################
#solution

class Comedian

	def initialize(attr) #instance method
		@name = attr [:name]
		@age = attr [:age]
		@joke = attr [:joke]
	end

	def getInfo
		return {"name" => @name,
				"age" => @age,
				"joke" => @joke}


	def self.jobDescription #class method
		return "make people laugh"
	end
end