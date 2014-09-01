class Greeter < ActiveRecord::Base
	
	def self.rand_greeting
		greetings = ["How are you today?", "What's new?", "What's up?", "Sup?",]
		return greetings.sample
	end
end
