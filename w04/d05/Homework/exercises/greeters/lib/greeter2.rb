require_relative './model'

class Greeter < Model
	def initialize(hash)
    	@hash = hash
	end

	def greet

		puts "#{@hash["greeting"]}, I'm #{@hash["name"]}"
	end

	def self.greet
		premade = ["Hello!", "Aloha!", "wazzzzzzzup?", "Good day."]
		premade.sample
	end
end