class Comedian
	def initialize(attributes)
		@attributes = attributes
	end

	def tell_joke
		puts @joke
	end

	def getInfo
		return @attributes
	end
end