class Comedian

	def initialize(name, age, fav_joke)
		@name = name
		@age = age
		@fav_joke = fav_joke
	end

	def tell_joke
		#puts 'Why did the chicken cross the road?'
		#puts 'To get to the other side'
		puts @fav_joke
	end
end