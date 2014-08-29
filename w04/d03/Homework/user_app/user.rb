require 'httparty'
require 'pry'

class User

	def initialize(attribute)
		@first_name = attribute[:fname]
		@last_name = attribute[:lname]
		@gender = attribute[:gender]
		@city = attribute[:city]
		@state = attribute[:state]
	end

	def greeting(fname, lname, city)
		return "My name is #{@first_name} #{@last_name} and I'm from #{@city}."
	end

	def self.random_user()
		rand_user = HTTParty.get("http://api.randomuser.me/")
		user = rand_user["results"][0]["user"]

		first_name = user["name"]["first"].capitalize
		last_name = user["name"]["last"].capitalize
		gender = user["gender"]
		city = user["location"]["city"].capitalize
		state = user["location"]["state"].capitalize

		return "My name is #{first_name} #{last_name} and I'm from #{city}."

	end
end

binding.pry



