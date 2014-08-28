require 'httparty'

class User

	def initialize(user_hash)
		@first_name = user_hash[:first_name]
		@last_name = user_hash[:last_name]
		@gender = user_hash[:gender]
		@city = user_hash[:city]
		@state = user_hash[:state]
	end

	def greeting
		puts "Hello. My name is #{@first_name}. I live in #{@city}."
	end

	def self.random_user
		response = HTTParty.get("http://api.randomuser.me")
		@first_name = response["results"][0]["user"]["name"]["first"].capitalize
		@last_name = response["results"][0]["user"]["name"]["last"].capitalize
		@gender = response["results"][0]["user"]["gender"].capitalize
		@city = response["results"][0]["user"]["location"]["city"].capitalize	
		@state = response["results"][0]["user"]["location"]["state"].capitalize	
		return { first_name: @first_name, last_name: @last_name, gender: @gender, city: @city, state: @state }
		
	end

end