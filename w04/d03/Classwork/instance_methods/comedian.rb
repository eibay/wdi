class Comedian

	def tell_joke(joke)
		# "Q: What do you call a French man wearing sandals? A: Philippe Philoppe"
		puts joke
	end
end

# only makes sense for instance of comedian to tell the joke, not the entire class.

class Comedian

	def initialize (name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke

	end

	def tell_joke
		puts "Hi, I'm #{@name}. I'm #{@age} and my favorite joke is '#{@fav_joke}'."
	end
end