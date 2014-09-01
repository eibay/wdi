require 'httparty'

class Greeter

	def initialize(greeting, name)
		@greeting = greeting
		@name = name
	end

	def the_greeting
		return @greeting
	end

	def self.rand_greeting
		greetings = ["How are you today?", "What's new?", "What's up?", "Sup?",]
		return greetings.sample
	end
end

greeters = {}

rand_user = HTTParty.get("http://api.randomuser.me/")
user = rand_user["results"][0]["user"]
first_name = user["name"]["first"].capitalize
last_name = user["name"]["last"].capitalize

full_name = first_name + ' ' + last_name
greeting = Greeter.rand_greeting

greeters["full_name"] = full_name
greeters["greeting"] = greeting

puts "Hello, my name is #{full_name}."
puts "#{greeting}"

