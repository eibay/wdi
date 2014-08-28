require 'httparty'

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
		@gender = user["results"][0]["user"]["gender"]
		@first_name = user["results"][0]["user"]["name"]["first"]
		@last_name = user["results"][0]["user"]["name"]["last"]
		@city = user["results"][0]["user"]["name"]["location"]["city"]
		@state = user["results"][0]["user"]["name"]["location"]["state"]

	end
	### Still dont get how to apply ramdomuser api. I need explain! ###
end