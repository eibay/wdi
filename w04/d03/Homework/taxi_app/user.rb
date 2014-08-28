# Part 2

# Create a User class with the attributes - first_name, last_name, gender, city, state
# Add an instance method called greeting
# It should have the instance "introduce" itself by returning it's full name and city
# Add a class method random_user that makes a HTTP request to http://randomuser.me/
# HINT:
# ``` HTTParty.get("http://api.randomuser.me/'")
require "httparty"
require "pry"

class User

	def initialize(attr)
		@first_name = attr["first_name"]
		@last_name = attr["last_name"]
		@gender = attr["gender"]
		@city = attr["city"]
		@state = attr["state"]
	end

	def greeting
		return "Hi, I'm #{@first_name} #{@last_name} from #{@city}."
	end

	def self.randomUser
		request = HTTParty.get("http://api.randomuser./me/")
		random_user = {}
		random_user["first_name"] = request["results"][0]["user"]["first"]
		random_user["last_name"] = request["results"][0]["user"]["last"]
		random_user["gender"] = request["results"][0]["user"]["gender"]
		random_user["city"] = request["results"][0]["user"]["location"]["city"]
		random_user["state"] = request["results"][0]["user"]["location"]["state"]
		binding.pry
		return Self.new(random_user)
	end












end