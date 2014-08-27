class Comedian

# jokes = ["Why did the chicken cross the road?", "Three guys are at a bar...", "What did the chicken say to the egg?"]
	
	def initialize(name, age, joke)
		@name = name
		@age = age
		@joke = joke
	end

	def  tell_joke
		puts @joke
	end
end
		# puts "This may take a while"
		# puts "Ready?"
		# input = gets.chomp
		# while true
		# 	puts "while"