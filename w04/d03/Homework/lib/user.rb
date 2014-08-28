require 'httparty'
require 'pry'

class User
	def initialize(attr)
		@first_name = attr[:first_name]
		@last_name = attr[:last_name]
		@gender = attr[:gender]
		@city = attr[:city]
		@state = attr[:state]
	end

	def getInfo
		return {
			"first_name" => @first_name,
			"last_name" => @last_name,
			"gender" => @gender,
			"city" => @city,
			"state" => @state
		}
	end

	def greeting
		puts "My name is #{@first_name} #{@last_name}. I am #{@gender} and was born in #{@city}, #{@state}"
	end

	def self.random_user
		user = HTTParty.get("http://api.randomuser.me/")
		random_info = user["results"][0]["user"]
		random_hash = {
		gender:random_info["gender"],
		first:random_info["name"]["first"],
		last:random_info["name"]["last"],
		city:random_info["name"]["location"]["city"],
		state:random_info["name"]["location"]["state"]
	}
		return random_info
	end
	### Still dont get how to apply ramdomuser api. I need explain! ###
end