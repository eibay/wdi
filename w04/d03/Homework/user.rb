require 'httparty'

class User

	def initialize(first_name,last_name, gender, city, state)
		@first_name = first_name
		@last_name = last_name
		@gender = gender
		@city = city
		@state = state
	end

	def greeting
		return "Hello!!! My name is #{@first_name} #{@last_name}, I am a #{@gender}. I am from #{@city}, #{@state}. "
	end

	def self.random_user
		random = HTTParty.get('http://api.randomuser.me/')

		first_name = random["results"][0]["user"]["name"]["first"]
		last_name = random["results"][0]["user"]["name"]["last"]
		gender = random["results"[0]]["user"]["gender"]
		city = random["results"[0]]["user"]["location"]["city"]
		state = random["results"[0]]["user"]["location"]["state"]

		return {"first_name" => first_name, "last_name" => last_name, "gender" => gender, "city" => city, "state" => state}
	end

	def self.random_user_creator
		random = HTTParty.get('http://api.randomuser.me/')

		first_name = random["results"][0]["user"]["name"]["first"]
		last_name = random["results"][0]["user"]["name"]["last"]
		gender = random["results"[0]]["user"]["gender"]
		city = random["results"[0]]["user"]["location"]["city"]
		state = random["results"[0]]["user"]["location"]["state"]

		return self.new{"first_name" => first_name, "last_name" => last_name, "gender" => gender, "city" => city, "state" => state}
	end
end