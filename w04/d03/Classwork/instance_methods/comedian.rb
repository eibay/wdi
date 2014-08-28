class Comedian

	def tell_joke(joke)
		# "Q: What do you call a French man wearing sandals? A: Philippe Philoppe"
		puts joke
	end
end

# only makes sense for instance of comedian to tell the joke, not the entire class.

class Comedian

	def initialize (attributes)
		@attributes = attributes
	end

	def tell_joke
		puts @attributes["joke"]
	end

		def getInfo 
		return @attributes
	end

end