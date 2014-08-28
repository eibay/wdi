require 'httparty'
require 'pry'
class User

	def initialize(hash)
		@fname = hash["first_name"]
		@lname = hash["last_name"]
		@gender = hash["gender"]
		@city = hash["city"]
		@state = hash["state"]
	end

	def greeting
		puts "Hi, I'm #{@fname} #{@lname}, hailing from #{@city}, #{@state}."
		return
	end

	def self.random_user
		rando = HTTParty.get("http://api.randomuser.me/")
		rando = rando["results"][0]["user"]
		hash = {
			"first_name" => rando["name"]["first"],
			"last_name" => rando["name"]["last"],
			"gender" => rando["gender"],
			"city" => rando["location"]["city"],
			"state" => rando["location"]["state"]
		}
		
		newUser = User.new(hash)
		newUser.greeting
		return 
	end
end
