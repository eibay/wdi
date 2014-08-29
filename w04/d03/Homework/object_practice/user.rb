require "httparty"
require "pry"

class User

	def initialize(first_name, last_name, gender, city, state)
		@first_name = first_name
		@last_name = last_name
		@gender = gender
		@city = city
		@state = state
	end

	attr_reader :first_name, :last_name, :gender, :city, :state

	def greeting
		"Hi!  I'm #{self.first_name} #{self.last_name}, from #{self.city}!"
	end

	def self.random_user
		response = HTTParty.get("http://api.randomuser.me")
		user = response["results"][0]["user"]
		gender = user["gender"]
		city = user["location"]["city"].capitalize
		state = user["location"]["state"].capitalize
		first = user["name"]["first"].capitalize
		last = user["name"]["last"].capitalize
		return [User.new(first, last, gender, city, state), response]
	end

end

